% Define Data Structures for various Levels
%% Level 1: 4 co-linear X axis points, full fuel, no fuel burn, no noise,
%           no failures
% Use this level for Homework 5
% The locations of the 4 points and the tolerances
LVL1.P1=[10;0;0]; %Data [x_m,y_m,theta_deg] for first point
LVL1.P1tol=[2;2;10]; %Tolerances for first point
LVL1.P2=[-10;0;0]; %Data [x_m,y_m,theta_deg] for second point
LVL1.P2tol=[0.5;0.5;1]; %Tolerances for second point
LVL1.P3=[20;0;0]; %Data [x_m,y_m,theta_deg] for third point
LVL1.P3tol=[1;1;3]; %Tolerances for third point
LVL1.P4=[-20;0;0]; %Data [x_m,y_m,theta_deg] for fourth point
LVL1.P4tol=[1;.2;2]; %Tolerances for fourth point
LVL1.Ptime=[1;1.5;2.5;1.25]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL1.M1=10; % fuel in tank 1, kg
LVL1.M2=10; % fuel in tank 2, kg
LVL1.M3=10; % fuel in tank 3, kg
LVL1.M4=10; % fuel in tank 4, kg
% Fuel burn on/off
LVL1.FB=0; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL1.SN=0; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL1.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL1.Sfail=[0 0 0 0 0 0 0 0 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL1.Sft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL1.Ufail=[0 0 0 0 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL1.Uft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
%% Level 2: test each axis independently, full fuel, no fuel burn, 
%           sensor noise on, no failures
% Use this level for Homework 6
% The locations of the 4 points and the tolerances
LVL2.P1=[0;0;90]; %Data [x_m,y_m,theta_deg] for first point
LVL2.P1tol=[2;2;10]; %Tolerances for first point
LVL2.P2=[0;10;90]; %Data [x_m,y_m,theta_deg] for second point
LVL2.P2tol=[0.5;0.5;1]; %Tolerances for second point
LVL2.P3=[20;10;90]; %Data [x_m,y_m,theta_deg] for third point
LVL2.P3tol=[1;1;3]; %Tolerances for third point
LVL2.P4=[-20;10;90]; %Data [x_m,y_m,theta_deg] for fourth point
LVL2.P4tol=[1;.2;2]; %Tolerances for fourth point
LVL2.Ptime=[1;1.5;2.5;1.25]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL2.M1=10; % fuel in tank 1, kg
LVL2.M2=10; % fuel in tank 2, kg
LVL2.M3=10; % fuel in tank 3, kg
LVL2.M4=10; % fuel in tank 4, kg
% Fuel burn on/off
LVL2.FB=0; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL2.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
% [xp xv xa yp yv ya tp tv ta]
LVL2.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL2.Sfail=[0 0 0 0 0 0 0 0 0]';
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL2.Sft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL2.Ufail=[0 0 0 0 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL2.Uft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
%% Level 3: 4 points in a diamond pattern, full fuel, fuel burn on, 
%           sensor noise on, sensor 2 fails to current value
% Use this level for Homework 7
% The locations of the 4 points and the tolerances
LVL3.P1=[0;15;45]; %Data [x_m,y_m,theta_deg] for first point
LVL3.P1tol=[1;.5;8]; %Tolerances for first point
LVL3.P2=[20;0;180]; %Data [x_m,y_m,theta_deg] for second point
LVL3.P2tol=[.5;1.5;3]; %Tolerances for second point
LVL3.P3=[0;-15;135]; %Data [x_m,y_m,theta_deg] for third point
LVL3.P3tol=[1;1;2]; %Tolerances for third point
LVL3.P4=[-20;0;-90]; %Data [x_m,y_m,theta_deg] for fourth point
LVL3.P4tol=[.2;.2;4]; %Tolerances for fourth point
LVL3.Ptime=[2;1.5;2.5;3]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL3.M1=10; % fuel in tank 1, kg
LVL3.M2=10; % fuel in tank 2, kg
LVL3.M3=10; % fuel in tank 3, kg
LVL3.M4=10; % fuel in tank 4, kg
% Fuel burn on/off
LVL3.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL3.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL3.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL3.Sfail=[0 2 0 0 0 0 0 0 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL3.Sft = [0 1
           10 10
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL3.Ufail=[0 0 0 0 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL3.Uft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
%% Level 4: 4 non-linear points, full fuel, fuel burn on, 
%           sensor noise on, thruster 2 fails closed, 
%           sensor 4 fails to current value
% Use this level for Homework 8
% The locations of the 4 points and the tolerances
LVL4.P1=[-10;-10;-180]; %Data [x_m,y_m,theta_deg] for first point
LVL4.P1tol=[1;.5;8]; %Tolerances for first point
LVL4.P2=[10;-10;-45]; %Data [x_m,y_m,theta_deg] for second point
LVL4.P2tol=[.5;1.5;3]; %Tolerances for second point
LVL4.P3=[20;-10;90]; %Data [x_m,y_m,theta_deg] for third point
LVL4.P3tol=[1;1;2]; %Tolerances for third point
LVL4.P4=[-20;15;45]; %Data [x_m,y_m,theta_deg] for fourth point
LVL4.P4tol=[.2;.2;4]; %Tolerances for fourth point
LVL4.Ptime=[2;1.5;2.5;3]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL4.M1=10; % fuel in tank 1, kg
LVL4.M2=10; % fuel in tank 2, kg
LVL4.M3=10; % fuel in tank 3, kg
LVL4.M4=10; % fuel in tank 4, kg
% Fuel burn on/off
LVL4.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL4.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL4.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL4.Sfail=[0 0 0 2 0 0 0 0 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL4.Sft = [0 1
            1 1
            0 1
           15 15
            0 1
            0 1
            0 1
            0 1
            0 1];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL4.Ufail=[0 -1 0 0 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL4.Uft = [0 1
            5 5
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
%% Level 5: 4 different angles, full fuel, fuel burn on, 
%           sensor noise on, no thruster failures, 
%           no sensor failures
% 	Check theta control
% The locations of the 4 points and the tolerances
LVL5.P1=[0;0;45]; %Data [x_m,y_m,theta_deg] for first point
LVL5.P1tol=[1;1;8]; %Tolerances for first point
LVL5.P2=[0;0;135]; %Data [x_m,y_m,theta_deg] for second point
LVL5.P2tol=[1;1;3]; %Tolerances for second point
LVL5.P3=[0;0;-135]; %Data [x_m,y_m,theta_deg] for third point
LVL5.P3tol=[1;1;2]; %Tolerances for third point
LVL5.P4=[0;0;-45]; %Data [x_m,y_m,theta_deg] for fourth point
LVL5.P4tol=[1;1;4]; %Tolerances for fourth point
LVL5.Ptime=[2;2;2;2]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL5.M1=10; % fuel in tank 1, kg
LVL5.M2=10; % fuel in tank 2, kg
LVL5.M3=10; % fuel in tank 3, kg
LVL5.M4=10; % fuel in tank 4, kg
% Fuel burn on/off
LVL5.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL5.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL5.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL5.Sfail=[0 0 0 0 0 0 0 0 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL5.Sft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL5.Ufail=[0 0 0 0 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL5.Uft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
%% Level 6: 4 different angles, reduced fuel, fuel burn on, 
%           sensor noise on, no thruster failures, 
%           no sensor failures
% 	Check theta control with off set CG
% The locations of the 4 points and the tolerances
LVL6.P1=[0;0;45]; %Data [x_m,y_m,theta_deg] for first point
LVL6.P1tol=[.4;.4;8]; %Tolerances for first point
LVL6.P2=[0;0;135]; %Data [x_m,y_m,theta_deg] for second point
LVL6.P2tol=[.4;.4;3]; %Tolerances for second point
LVL6.P3=[0;0;-135]; %Data [x_m,y_m,theta_deg] for third point
LVL6.P3tol=[.4;.4;2]; %Tolerances for third point
LVL6.P4=[0;0;-45]; %Data [x_m,y_m,theta_deg] for fourth point
LVL6.P4tol=[.4;.4;4]; %Tolerances for fourth point
LVL6.Ptime=[2;2;2;2]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL6.M1=10; % fuel in tank 1, kg
LVL6.M2=10; % fuel in tank 2, kg
LVL6.M3=1; % fuel in tank 3, kg
LVL6.M4=1; % fuel in tank 4, kg
% Fuel burn on/off
LVL6.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL6.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL6.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL6.Sfail=[0 0 0 0 0 0 0 0 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL6.Sft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL6.Ufail=[0 0 0 0 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL6.Uft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
%% Level 7: The duck level
% 4 points and the tolerances
% This is the head of the duck!
LVL7.P1=[0;10;180]; %Data [x_m,y_m,theta_deg] for first point
LVL7.P1tol=[0.9;1.5;3]; %first point tolerance

% This is arm 1
LVL7.P2=[-5;0;135]; %Data [x_m,y_m,theta_deg] for second point 
LVL7.P2tol=[1;1;2]; %second point tolerance

% These are the legs
LVL7.P3=[0;-5;-90]; %Data [x_m,y_m,theta_deg] for third point 
LVL7.P3tol=[.5;1.5;3]; %third point tolerance

% this is arm 2
LVL7.P4=[5;0;45]; %Data [x_m,y_m,theta_deg] for fourth point
LVL7.P4tol=[1;1;2]; %fourth point tolerance 

LVL7.Ptime=[2.5;2;1.5;4]; %Time remain within tolerances

% Initial mass of fuel in each tank
LVL7.M1=9; % tank 1, kg
LVL7.M2=8; % tank 2, kg
LVL7.M3=9; % tank 3, kg
LVL7.M4=8; % tank 4, kg

% Fuel burn is on for this
LVL7.FB=1; % 0 = fuel burn off, 1 = use fuel burn 

% Sensor noise is on
LVL7.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors

% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL7.SigSense=[.6 .23 .07 .4 .23 0.06 2 0.04 .04]'; 

% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL7.Sfail=[0 0 2 0 0 0 0 0 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL7.Sft = [0 1
            0 1
            10 10
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL7.Ufail=[0 2 0 0 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL7.Uft = [0 1
            10 10
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
%% LVL 8: Better hope you have manual adjustement lol
LVL8.P1=[10;10;90]; %Data [x_m,y_m,theta_deg] for first point
LVL8.P1tol=[0.2;0.2;1]; %Tolerances for first point
LVL8.P2=[-10;-10;45]; %Data [x_m,y_m,theta_deg] for second point
LVL8.P2tol=[0.2;0.2;1]; %Tolerances for second point
LVL8.P3=[20;15;135]; %Data [x_m,y_m,theta_deg] for third point
LVL8.P3tol=[0.2;0.2;1]; %Tolerances for third point
LVL8.P4=[-20;-15;0]; %Data [x_m,y_m,theta_deg] for fourth point
LVL8.P4tol=[0.2;0.2;1]; %Tolerances for fourth point
LVL8.Ptime=[1;1;1;2]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL8.M1=8; % fuel in tank 1, kg
LVL8.M2=8; % fuel in tank 2, kg
LVL8.M3=8; % fuel in tank 3, kg
LVL8.M4=8; % fuel in tank 4, kg
% Fuel burn on/off
LVL8.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL8.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL8.SigSense=[8 8 8 8 8 8 90 90 90]'; %Dont really know where you are lmao
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL8.Sfail=[1 -1 0 -1 1 0 1 -1 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL8.Sft = [0 0
            0  0
            20 20
            0 .0
            0 .0
            20 20
            0 .0
            0 .0
            20 20];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL8.Ufail=[0 0 0 0 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL8.Uft = [0 30
            0 1
            0 20
            0 1
            0 40
            0 1
            0 1
            0 1
            0 1
            0 1];
%% Level 9:
% Full Fuel
% Fuel Burn off 
% Sensor Noise on
% Thrusters 1, 3 Fail to Minimum
% Sensors 7, 8, 9 Fail to Current Value

% The Locations of the 4 Points and the Tolerances:
LVL9.P1=[-20;15;179]; % Data [x_m, y_m, theta_deg] for the First Point
LVL9.P1tol=[.5;.5;5]; % Tolerances for the First Point
LVL9.P2=[20;-15;-179]; % Data [x_m, y_m, theta_deg] for the Second Point
LVL9.P2tol=[.4;.4;4]; % Tolerances for the Second Point
LVL9.P3=[-1;-1;179]; % Data [x_m, y_m, theta_deg] for the Third Point
LVL9.P3tol=[.3;.3;3]; % Tolerances for the Third Point
LVL9.P4=[1;1;-179]; % Data [x_m, y_m, theta_deg] for the Fourth Point
LVL9.P4tol=[.2;.2;2]; % Tolerances for the Fourth Point
LVL9.Ptime=[2.5;2.5;2.5;2.5]; % Time to Remain Within Tolerances

% Initial Mass of Fuel in Each Tank
LVL9.M1=10; % Fuel in Tank 1, kg
LVL9.M2=10; % Fuel in Tank 2, kg
LVL9.M3=10; % Fuel in Tank 3, kg
LVL9.M4=10; % Fuel in Tank 4, kg

% Fuel Burn On/Off
LVL9.FB=1; % 0 = Fuel burn off, 1 = Use fuel burn to modify mass properties

% Sensor Noise On/Off
LVL9.SN=1; % 0 = Noise off, 1 = Use SigSense to add noise to sensors

% Sensor Noise Variances
% X, Y, Theta, Position, Velocity, Acceleration
LVL9.SigSense=[0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5]';

% Sensor Failure Logicals
%  0 = Sensor does not fail
% -1 = Sensor fails to minimum
%  1 = Sensor fails to maximum
%  2 = Sensor fails to current
LVL9.Sfail=[0 0 0 0 0 0 2 2 2]'; 

% Time Range When Sensor Failures Occur [t1 t2] where t2>=t1
LVL9.Sft = [0 0
             0 0
             0 0
             0 0
             0 0
             0 0
             64 64
             64 64
             64 64];

% Thrust Actuator Failure Logicals
%  0 = Actuator does not fail
% -1 = Actuator fails to minimum
%  1 = Actuator fails to maximum
%  2 = Actuator fails to current
LVL9.Ufail=[-1 0 -1 0 0 0 0 0 0 0]'; 

% Time Range When Actuator Failures Occur [t1 t2] where t2>=t1
LVL9.Uft = [0 0
             0 0
             0 0
             0 0
             0 0
             0 0
             0 0
             0 0
             0 0
             0 0];
%% Level 10: 
% Half Fuel on 1, 3, quarter on 4, and full on 2
% Fuel Burn on 
% Sensor Noise on

% Thrusters 6, 7 Fail to Current
% Thrusters 1, 3 Fail Closed
% Thrusters 2, 5 Fail Open

% Sensors 2, 3, 6, 8  Fail to Current Value
% Sensors 1 and 7     Fail to Minimum Value
% Sensor  4           Fail to Maximum Value

% The Locations of the 4 Points and the Tolerances:
LVL10.P1=[20;0;178]; % Data [x_m, y_m, theta_deg] for the First Point
LVL10.P1tol=[.2;.2;1]; % Tolerances for the First Point

LVL10.P2=[20;0;178]; % Data [x_m, y_m, theta_deg] for the Second Point
LVL10.P2tol=[.5;.5;5]; % Tolerances for the Second Point

LVL10.P3=[20;0;178]; % Data [x_m, y_m, theta_deg] for the Third Point
LVL10.P3tol=[.5;.5;5]; % Tolerances for the Third Point

LVL10.P4=[20;0;178]; % Data [x_m, y_m, theta_deg] for the Fourth Point
LVL10.P4tol=[.5;.5;5]; % Tolerances for the Fourth Point

LVL10.Ptime=[.3;2;1;5]; % Time to Remain Within Tolerances

% Initial Mass of Fuel in Each Tank
LVL10.M1=5; % Fuel in Tank 1, kg
LVL10.M2=10; % Fuel in Tank 2, kg
LVL10.M3=5; % Fuel in Tank 3, kg
LVL10.M4=2.5; % Fuel in Tank 4, kg

% Fuel Burn On/Off
LVL10.FB=1; % 0 = Fuel burn off, 1 = Use fuel burn to modify mass properties

% Sensor Noise On/Off
LVL10.SN=1; % 0 = Noise off, 1 = Use SigSense to add noise to sensors

% Sensor Noise Variances
% X, Y, Theta, Position, Velocity, Acceleration
LVL10.SigSense=[0.1 0.2 0.5 0.3 0.4 1.0 0.5 0.6 9.0]';

% Sensor Failure Logicals
%  0 = Sensor does not fail
% -1 = Sensor fails to minimum
%  1 = Sensor fails to maximum
%  2 = Sensor fails to current
LVL10.Sfail=[-1 2 2 1 0 2 -1 2 0]'; 

% Time Range When Sensor Failures Occur [t1 t2] where t2>=t1
LVL10.Sft = [0 1 
             30 31 
             30 32
             10 12
             0 0
             45 50
             0 1
             30 31
             0 0];

% Thrust Actuator Failure Logicals
%  0 = Actuator does not fail
% -1 = Actuator fails to minimum
%  1 = Actuator fails to maximum
%  2 = Actuator fails to current
LVL10.Ufail=[-1 1 -1 0 1 2 2 0 0 0]'; 

% Time Range When Actuator Failures Occur [t1 t2] where t2>=t1
LVL10.Uft = [40 45
             1 3
             20 21
             0 0
             41 46
             3 5
             20 21
             0 0
             0 0
             0 0];
%% LVL 11
% fule burn on, sensor noise on, one velocity sensor failure, one 
% acceleration sensor failure, and one thruster failure

% The locations of the 4 points and the tolerances
LVL11.P1    = [-14;10;25];    % Data [x_m,y_m,theta_deg] for first point
LVL11.P1tol = [1;0.8;5];      % Tolerances for first point

LVL11.P2    = [12;-12;-60];   % Data [x_m,y_m,theta_deg] for second point
LVL11.P2tol = [0.7;1;4];      % Tolerances for second point

LVL11.P3    = [5;14;90];      % Data [x_m,y_m,theta_deg] for third point
LVL11.P3tol = [1.4;1.2;7];    % Tolerances for third point

LVL11.P4    = [-18;-5;-120];  % Data [x_m,y_m,theta_deg] for fourth point
LVL11.P4tol = [1;1.8;2];      % Tolerances for fourth point

LVL11.Ptime = [1;1.8;1.5;0.9]; % Time to remain within tolerances

% Initial mass of fuel in each tank
LVL11.M1 = 10;  % fuel in tank 1, kg
LVL11.M2 = 10;  % fuel in tank 2, kg
LVL11.M3 = 10;  % fuel in tank 3, kg
LVL11.M4 = 0.8; % fuel in tank 4, kg

% Fuel burn on/off
LVL11.FB = 1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties

% Sensor noise on/off
LVL11.SN = 1; % 0 = noise off, 1 = use SigSense to add noise to sensors

% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL11.SigSense = [0.2 0.08 0.02 0.2 0.08 0.02 1 0.05 0.05]'; 

% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL11.Sfail = [0 2 0 0 0 2 0 0 0]'; 

% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL11.Sft = [0 1
             15 200
             0 1
             0 1
             0 1
             30 200
             0 1
             0 1
             0 1];

% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL11.Ufail = [0 0 0 0 0 2 0 0 0 0]'; 

% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL11.Uft = [0 1
             0 1
             0 1
             0 1
             0 1
             22 200
             0 1
             0 1
             0 1
             0 1];
%% Level 12: Superimposed points that are not in order,
% Tests if the model can handle if points are accidentally taken out of the
% comanded order
%           no failures
% The locations of the 4 points and the tolerances
LVL12.P1=[20;1;0]; %Data [x_m,y_m,theta_deg] for first point
LVL12.P1tol=[0.5;0.5;10]; %Tolerances for first point
LVL12.P2=[20;0;0]; %Data [x_m,y_m,theta_deg] for second point
LVL12.P2tol=[2;2;10]; %Tolerances for second point
LVL12.P3=[0;15;0]; %Data [x_m,y_m,theta_deg] for third point
LVL12.P3tol=[1;1;3]; %Tolerances for third point
LVL12.P4=[-20;-15;0]; %Data [x_m,y_m,theta_deg] for fourth point
LVL12.P4tol=[1;.2;2]; %Tolerances for fourth point
LVL12.Ptime=[1;0.01;2.5;1.25]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL12.M1=2; % fuel in tank 1, kg
LVL12.M2=2; % fuel in tank 2, kg
LVL12.M3=2; % fuel in tank 3, kg
LVL12.M4=2; % fuel in tank 4, kg
% Fuel burn on/off
LVL12.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL12.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL12.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL12.Sfail=[0 0 0 0 0 0 0 0 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL12.Sft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL12.Ufail=[0 0 0 0 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL12.Uft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
%% Level 13: 4 co-linear XYrot axis points, full fuel, fuel burn, noise,
%           6 sensor failures, 2 full open thruster failures
% The locations of the 4 points and the tolerances
LVL13.P1=[20;-15;90]; %Data [x_m,y_m,theta_deg] for first point
LVL13.P1tol=[0.5;1;3]; %Tolerances for first point
LVL13.P2=[-20;10;7]; %Data [x_m,y_m,theta_deg] for second point
LVL13.P2tol=[.5;1;10]; %Tolerances for second point
LVL13.P3=[20;15;150]; %Data [x_m,y_m,theta_deg] for third point
LVL13.P3tol=[1;0.5;5]; %Tolerances for third point
LVL13.P4=[-15;-10;-170]; %Data [x_m,y_m,theta_deg] for fourth point
LVL13.P4tol=[0.5;0.5;3]; %Tolerances for fourth point
LVL13.Ptime=[2;2;2;2]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL13.M1=10; % fuel in tank 1, kg
LVL13.M2=10; % fuel in tank 2, kg
LVL13.M3=10; % fuel in tank 3, kg
LVL13.M4=10; % fuel in tank 4, kg
% Fuel burn on/off
LVL13.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL13.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL13.SigSense=[1 2 2 1 2 2 1 2 2]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL13.Sfail=[2 2 0 2 2 0 2 2 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL13.Sft = [0 0
            0 0
            0 0
            0 0
            0 0
            0 0
            0 0
            0 0
            0 0];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL13.Ufail=[0 1 0 1 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL13.Uft = [0 0
            2 2 
            0 0
            0 0
            0 0
            0 0
            0 0
            0 0
            0 0
            0 0];
%% Level 14: 4 non-linear points, partial fuel, fuel burn on, 
%           sensor noise on, thrusters 2 & 5 fail closed, 
%           sensors 1 & 3 fail to min
%           
% The locations of the 4 points and the tolerances
LVL14.P1=[-20;-10;-100]; %Data [x_m,y_m,theta_deg] for first point
LVL14.P1tol=[1;1;8]; %Tolerances for first point
LVL14.P2=[-12;10;45]; %Data [x_m,y_m,theta_deg] for second point
LVL14.P2tol=[2;1.75;6]; %Tolerances for second point
LVL14.P3=[11;-8;-90]; %Data [x_m,y_m,theta_deg] for third point
LVL14.P3tol=[1.8;1.9;7]; %Tolerances for third point
LVL14.P4=[15;15;0]; %Data [x_m,y_m,theta_deg] for fourth point
LVL14.P4tol=[.8;1.2;4.5]; %Tolerances for fourth point
LVL14.Ptime=[.2;3.5;5;2]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL14.M1=9; % fuel in tank 1, kg
LVL14.M2=8; % fuel in tank 2, kg
LVL14.M3=9; % fuel in tank 3, kg
LVL14.M4=8; % fuel in tank 4, kg
% Fuel burn on/off
LVL14.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL14.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL14.SigSense=[.5 .25 .4 .5 .35 0.1 .05 .1 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL14.Sfail=[-1 0 0 -1 0 0 0 0 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL14.Sft = [0 20
            0 1
            0 1
           15 30
            0 1
            0 1
            0 1
            0 1
            0 1];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL14.Ufail=[0 -1 0 0 0 0 0 -1 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL14.Uft = [0 1
            5 10
            0 1
            0 1
            0 1
            0 1
            0 1
            0 75
            0 1
            0 1];
%% Level 15: 4 OOPS!! You ran a stop sign!
% The locations of the 4 points and the tolerances
LVL15.P1=[8;10;180]; %Data [x_m,y_m,theta_deg] for first point
LVL15.P1tol=[1;.5;8]; %Tolerances for first point
LVL15.P2=[-10;10;0]; %Data [x_m,y_m,theta_deg] for second point
LVL15.P2tol=[.5;1.5;3]; %Tolerances for second point
LVL15.P3=[-10;-15;30]; %Data [x_m,y_m,theta_deg] for third point
LVL15.P3tol=[.5;.5;2]; %Tolerances for third point
LVL15.P4=[10;-15;0]; %Data [x_m,y_m,theta_deg] for fourth point
LVL15.P4tol=[.5;.5;2]; %Tolerances for fourth point
LVL15.Ptime=[2;1.5;2.5;3]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL15.M1=10; % fuel in tank 1, kg
LVL15.M2=10; % fuel in tank 2, kg
LVL15.M3=10; % fuel in tank 3, kg
LVL15.M4=10; % fuel in tank 4, kg
% Fuel burn on/off
LVL15.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL15.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL15.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL15.Sfail=[2 2 2 2 2 2 2 2 2]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL15.Sft = [0 120
            0 120
            0 120
            0 120
            0 120
            0 120
            0 120
            0 120
            0 120];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL15.Ufail=[0 0 -1 -1 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL15.Uft = [0 1
            0 1
            15 15
            15 15
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
%% LVL 16
% Point data [x_m; y_m; theta_deg]
LVL16.P1 = [-18;  12;  170];
LVL16.P1tol = [0.8; 0.8; 6];
LVL16.P2 = [ 16;  10; -135];
LVL16.P2tol = [0.8; 0.8; 5];
LVL16.P3 = [ 18; -12;   95];
LVL16.P3tol = [0.6; 0.6; 3];
LVL16.P4 = [-16; -14;   40];
LVL16.P4tol = [0.3; 0.3; 2];
% Time to remain within tolerances
LVL16.Ptime = [1.5; 2.0; 2.0; 3.0];
% Initial mass of fuel in each tank (kg)
% Only one tank is below 1 kg, which satisfies HW8 rules
LVL16.M1 = 10.0;
LVL16.M2 = 10.0;
LVL16.M3 = 10.0;
LVL16.M4 = 10.0;
% Fuel burn on/off
LVL16.FB = 1;
% Sensor noise on/off
LVL16.SN = 1;
% Sensor Noise Variances
% [Xpos Xvel Xacc Ypos Yvel Yacc ThetaPos ThetaVel ThetaAcc]'
LVL16.SigSense = [0.45 0.30 0.05  0.45 0.30 0.05  2.0 0.08 0.08]';
% Sensor failures
% 0 = no fail, -1 = min, 1 = max, 2 = current
% Fail and and y velcoity to current after some motion has started.
LVL16.Sfail = [0 2 0  0 2 0  0 0 0]';
% Failure times [t1 t2]
LVL16.Sft = [0 1
             3 3
             0 1
             0 1
             12 12
             0 1
             0 1
             0 1
             0 1];
% Thruster actuator failures
% Fail one x-body thruster closed after the first maneuver starts.
LVL16.Ufail = [0 -1 0 0 0 0 0 0 0 0]';
% Failure times [t1 t2]
LVL16.Uft = [0 1
             40 40
             0 1
             0 1
             0 1
             0 1
             0 1
             0 1
             0 1
             0 1];
%% Level 33: 4 co-linear X axis points, full fuel, fuel burn, noise,
%           Thruster 4 fails full open
% The locations of the 4 points and the tolerances
LVL33.P1=[10;0;0]; %Data [x_m,y_m,theta_deg] for first point
LVL33.P1tol=[2;2;10]; %Tolerances for first point
LVL33.P2=[-10;0;0]; %Data [x_m,y_m,theta_deg] for second point
LVL33.P2tol=[0.5;0.5;1]; %Tolerances for second point
LVL33.P3=[20;0;0]; %Data [x_m,y_m,theta_deg] for third point
LVL33.P3tol=[1;1;3]; %Tolerances for third point
LVL33.P4=[-20;0;0]; %Data [x_m,y_m,theta_deg] for fourth point
LVL33.P4tol=[1;.2;2]; %Tolerances for fourth point
LVL33.Ptime=[1;1.5;2.5;1.25]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL33.M1=10; % fuel in tank 1, kg
LVL33.M2=10; % fuel in tank 2, kg
LVL33.M3=10; % fuel in tank 3, kg
LVL33.M4=10; % fuel in tank 4, kg
% Fuel burn on/off
LVL33.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL33.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta position, velocity, acceleration
LVL33.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL33.Sfail=[0 0 0 0 0 0 0 0 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL33.Sft = [0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL33.Ufail=[0 0 0 1 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL33.Uft = [0 1
            0 1
            0 1
            1 1
            0 1
            0 1
            0 1
            0 1
            0 1
            0 1];
%% Level 42: Random Points, no failures
% Randomly select a number
CLK=clock;
n=ceil(CLK(end));
for ii=n:-1:1
    CLK=clock;
    MxCLK=ceil(CLK(end));
    for jj=1:MxCLK
        num=ceil(rand(1)*ii);
    end %jj
end %ii
rx1=round((rand(1)-.5)*40);
rx2=round((rand(1)-.5)*40);
rx3=round((rand(1)-.5)*40);
rx4=round((rand(1)-.5)*40);
ry1=round((rand(1)-.5)*30);
ry2=round((rand(1)-.5)*30);
ry3=round((rand(1)-.5)*30);
ry4=round((rand(1)-.5)*30);
rt1=round((rand(1)-.5)*360);
rt2=round((rand(1)-.5)*360);
rt3=round((rand(1)-.5)*360);
rt4=round((rand(1)-.5)*360);
PT=0.1*round(rand(4,1)*50);
% MR=ceil(rand(4,1)*10);
MR=ceil(rand(4,1)*7)+3; % start with at least 30% in each tank
PTT=[max(0.2,0.1*round(rand(2,4)*20));max(1,0.1*round(rand(1,4)*100))];
% The locations of the 4 points and the tolerances
LVL42.P1=[rx1;ry1;rt1]; %Data [x_m,y_m,theta_deg] for first point
LVL42.P1tol=PTT(:,1); %Tolerances for first point
LVL42.P2=[rx2;ry2;rt2]; %Data [x_m,y_m,theta_deg] for second point
LVL42.P2tol=PTT(:,2); %Tolerances for second point
LVL42.P3=[rx3;ry3;rt3]; %Data [x_m,y_m,theta_deg] for third point
LVL42.P3tol=PTT(:,3); %Tolerances for third point
LVL42.P4=[rx4;ry4;rt4]; %Data [x_m,y_m,theta_deg] for fourth point
LVL42.P4tol=PTT(:,4); %Tolerances for fourth point
LVL42.Ptime=PT; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL42.M1=MR(1); % fuel in tank 1, kg
LVL42.M2=MR(2); % fuel in tank 2, kg
LVL42.M3=MR(3); % fuel in tank 3, kg
LVL42.M4=MR(4); % fuel in tank 4, kg
% Fuel burn on/off
LVL42.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL42.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta, position, velocity, acceleration
% [xp xv xa yp yv ya tp tv ta]
LVL42.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL42.Sfail=[0 0 0 0 0 0 0 0 0]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL42.Sft = [1 1
            2 2
            .1 .1
            3 3
            4 4
            5 5
            6 6
            7 7
            8 8];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL42.Ufail=[0 0 0 0 0 0 0 0 0 0]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL42.Uft = [0 1
            1 1
            2 3
            0 1
            1 2
            2 3
            0 1
            1 2
            2 3
            3 4];
%% Level 66: Random Points, random failures, random noise levels
% Randomly select a number
CLK=clock;
n=ceil(CLK(end));
for ii=n:-1:1
    CLK=clock;
    MxCLK=ceil(CLK(end));
    for jj=1:MxCLK
        num=ceil(rand(1)*ii);
    end %jj
end %ii
rx1=round((rand(1)-.5)*40);
rx2=round((rand(1)-.5)*40);
rx3=round((rand(1)-.5)*40);
rx4=round((rand(1)-.5)*40);
ry1=round((rand(1)-.5)*30);
ry2=round((rand(1)-.5)*30);
ry3=round((rand(1)-.5)*30);
ry4=round((rand(1)-.5)*30);
rt1=round((rand(1)-.5)*360);
rt2=round((rand(1)-.5)*360);
rt3=round((rand(1)-.5)*360);
rt4=round((rand(1)-.5)*360);
PT=0.1*round(rand(4,1)*50);
PTT=[max(0.2,0.1*round(rand(2,4)*20));max(1,0.1*round(rand(1,4)*100))];
% The locations of the 4 points and the tolerances
LVL66.P1=[rx1;ry1;rt1]; %Data [x_m,y_m,theta_deg] for first point
LVL66.P1tol=PTT(:,1); %Tolerances for first point
LVL66.P2=[rx2;ry2;rt2]; %Data [x_m,y_m,theta_deg] for second point
LVL66.P2tol=PTT(:,2); %Tolerances for second point
LVL66.P3=[rx3;ry3;rt3]; %Data [x_m,y_m,theta_deg] for third point
LVL66.P3tol=PTT(:,3); %Tolerances for third point
LVL66.P4=[rx4;ry4;rt4]; %Data [x_m,y_m,theta_deg] for fourth point
LVL66.P4tol=PTT(:,4); %Tolerances for fourth point
LVL66.Ptime=PT; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL66.M1=10; % fuel in tank 1, kg
LVL66.M2=10; % fuel in tank 2, kg
LVL66.M3=10; % fuel in tank 3, kg
LVL66.M4=10; % fuel in tank 4, kg
% Fuel burn on/off
LVL66.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL66.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta, position, velocity, acceleration
% [xp xv xa yp yv ya tp tv ta]
LVL66.SigSense=[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'*max(0.1,rand(1)*10); 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
SF=rand(1,9);
SF1=SF<=0.1;
SF2=(SF<=0.2).*(SF>0.1);
SF3=(SF<=0.3).*(SF>0.2);
SFF=-1*SF1+2*SF2+SF3;
LVL66.Sfail=SFF'; 
T1=round(rand(9,1)*60);
T2=round(rand(9,1)*60);
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL66.Sft = [T1 T1+T2];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
UF=rand(1,8);
UF1=UF<=0.1;
UF2=(UF<=0.2).*(UF>0.1);
UF3=(UF<=0.3).*(UF>0.2);
UFF=-1*UF1+2*UF2+UF3;
LVL66.Ufail=[UFF';0;0]; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
T1=round(rand(10,1)*60);
T2=round(rand(10,1)*60);
LVL66.Uft = [T1 T1+T2];
%% Level 99: Kobayashi Maru, the impossible Boss level
% The locations of the 4 points and the tolerances
LVL99.P1=[20;15;0]; %Data [x_m,y_m,theta_deg] for first point
LVL99.P1tol=[.2;.2;1]; %Tolerances for first point
LVL99.P2=[20;15;-180]; %Data [x_m,y_m,theta_deg] for second point
LVL99.P2tol=[0.2;.2;1]; %Tolerances for second point
LVL99.P3=[-20;-15;360]; %Data [x_m,y_m,theta_deg] for third point
LVL99.P3tol=[.2;.2;1]; %Tolerances for third point
LVL99.P4=[20;-15;180]; %Data [x_m,y_m,theta_deg] for fourth point
LVL99.P4tol=[.2;.2;1]; %Tolerances for fourth point
LVL99.Ptime=[5;5;5;5]; %Time to remain within tolerances
% Initial mass of fuel in each tank
LVL99.M1=2; % fuel in tank 1, kg
LVL99.M2=10; % fuel in tank 2, kg
LVL99.M3=1; % fuel in tank 3, kg
LVL99.M4=10; % fuel in tank 4, kg
% Fuel burn on/off
LVL99.FB=1; % 0 = fuel burn off, 1 = use fuel burn to modify mass properties
% Sensor noise on/off
LVL99.SN=1; % 0 = noise off, 1 = use SigSense to add noise to sensors
% Sensor Noise Variances
% X Y Theta, position, velocity, acceleration
% [xp xv xa yp yv ya tp tv ta]
LVL99.SigSense=4*[.5 .25 .04 .5 .25 0.04 2 0.05 .05]'; 
% Sensor failure logicals
%  0 = does not fail
% -1 = sensor fails to minimum
%  1 = sensor fails to maximum
%  2 = sensor fails to current
LVL99.Sfail=[2 2 2 2 2 2 2 2 2]'; 
% Time range when sensor failures occur [t1 t2] where t2>=t1
LVL99.Sft = [1 1
            2 2
            .1 .1
            3 3
            14 14
            5 5
            26 26
            7 7
            8 8];
% Thrust Actuator failure logicals
%  0 = does not fail
% -1 = actuator fails to minimum
%  1 = actuator fails to maximum
%  2 = actuator fails to current
LVL99.Ufail=[2 2 2 2 2 2 2 2 2 2]'; 
% Time range when actuator failures occur [t1 t2] where t2>=t1
LVL99.Uft = [0 1
            1 1
            22 23
            30 31
            1 2
            12 13
            0 1
            1 2
            21 33
            3 40];
