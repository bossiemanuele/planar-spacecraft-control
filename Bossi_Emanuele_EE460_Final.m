% Bossi_Emanuele_EE460_Final.m
Sconfig = 1;

INIT_S3D_01;
close;

% Set effective mass properties for controller/observer design
Mdry = Mbase;
Jdry = Jbase + JC0;

if LVL.FB == 0
    % No fuel burn: plant mass properties stay constant
    M_eff = M;
    J_eff = J;
else
    % Fuel burn on: use a representative fixed value between initial and dry properties
    M_eff = 0.5*(M + Mdry);
    J_eff = 0.5*(J + Jdry);
end

% Control Allocation constants
P = [1  1 -1 -1  0  0  0  0;
     0  0  0  0 -1  1  1 -1;
     -1  1 -1  1  3 -3  3 -3];

% Allocator
A = P'/(P*P');    % A = P^T (P P^T)^(-1)

A = 2*A;

% Regulator

% NO FAILURES
% Desired closed-loop behavior
wn_xy   = 0.75;
zeta_xy = 0.75;

wn_th   = 0.55;
zeta_th = 0.75;

% PD gains from second-order matching
Kpx = M_eff * wn_xy^2;
Kdx = 2 * zeta_xy * wn_xy * M_eff;

Kpy = M_eff * wn_xy^2;
Kdy = 2 * zeta_xy * wn_xy * M_eff;

Kptheta = J_eff * wn_th^2;
Kdtheta = 2 * zeta_th * wn_th * J_eff;

% FAILURE MODE
% Slower response after thruster failure detection
% Reduce natural frequency to make the system take longer
% Keep damping ratio similar

wn_xy_fail   = 0.75;
zeta_xy_fail = 0.75;

wn_th_fail   = 0.55;
zeta_th_fail = 0.75;

% PD gains for failure condition
Kpx_fail = M_eff * wn_xy_fail^2;
Kdx_fail = 2 * zeta_xy_fail * wn_xy_fail * M_eff;

Kpy_fail = M_eff * wn_xy_fail^2;
Kdy_fail = 2 * zeta_xy_fail * wn_xy_fail * M_eff;

Kptheta_fail = J_eff * wn_th_fail^2;
Kdtheta_fail = 2 * zeta_th_fail * wn_th_fail * J_eff;

% Thruster geometry map
G = [1,  1, -1, -1,  0,  0,  0,  0;   % FxB
     0,  0,  0,  0, -1,  1,  1, -1;   % FyB
    -1,  1, -1,  1,  3, -3,  3, -3];  % MzB

% Observer
A_obs = [ 0  1  0  0  0  0;
          0  0  0  0  0  0;
          0  0  0  1  0  0;
          0  0  0  0  0  0;
          0  0  0  0  0  1;
          0  0  0  0  0  0 ];

B_obs = [ 0     0     0;
          1/M_eff   0     0;
          0     0     0;
          0     1/M_eff   0;
          0     0     0;
          0     0     1/J_eff ];

C_obs = [ 1 0 0 0 0 0;
          0 1 0 0 0 0;
          0 0 0 0 0 0;
          0 0 1 0 0 0;
          0 0 0 1 0 0;
          0 0 0 0 0 0;
          0 0 0 0 1 0;
          0 0 0 0 0 1;
          0 0 0 0 0 0 ];

D_obs = [ 0     0     0;
          0     0     0;
          1/M_eff   0     0;
          0     0     0;
          0     0     0;
          0     1/M_eff   0;
          0     0     0;
          0     0     0;
          0     0     1/J_eff ];

poles = [-6 -8  -6 -8  -10 -12];

% L_obs = place(A_obs', C_obs', poles)'; This have been replaced with Kalman Filter

% Kalman Filter
G_obs = eye(6);
Q_obs = eye(6);
GI = inv(G_obs);
R = diag(LVL.SigSense.^2);
RI = pinv(R);
CI = pinv(C_obs);

% Filtering
Hs = tf([5], [1 5]);
Hs_discrete = c2d(Hs, dt, 'tustin');
[num_lp, den_lp] = tfdata(Hs_discrete, 'v');
Hs2 = tf([1], [1 5]);
Hs2_discrete = c2d(Hs2, dt, 'tustin');
[num_lp2, den_lp2] = tfdata(Hs2_discrete, 'v');
Hs_dddot = tf([0.30], [1 0.30]);
Hs_discrete_dddot = c2d(Hs_dddot, dt, 'tustin');
[num_lp_dddot, den_lp_dddot] = tfdata(Hs_discrete_dddot, 'v');

% Command (BangCoastBang)
max_thrust_ratio = 0.5;
max_qddot_x     = max_thrust_ratio*(200/M_eff);
max_qddot_y     = max_thrust_ratio*(200/M_eff);
max_qddot_theta = max_thrust_ratio*(800/J_eff)*180/pi;

max_qddot = [max_qddot_x; max_qddot_y; max_qddot_theta];

% Bang-to-Coast ratio
r_bang = 0.5;

% Joystick
tau = 0.5;