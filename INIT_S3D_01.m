% Initialization file for EE460_S3D_Plant.slx
clear PlotS3D FuelBurned PDONE
figure(); % create a new figure for the plot
GetLVL_S3D_ALL %run script to define structure of levels
LVL=LVL12; % pick a specific level
dt0=0.001; %time step plant (fastest), seconds
dt=0.01; %time step control computer, seconds
d2r=pi/180; %degrees to radians
r2d=180/pi; %radian to degrees
fr=100; %frame rate, number of dt0 frames before updating plot
mdti=(1/300); %Rate of fuel burn, kg/(s*N)

% Mass Properties Data
Mbase=60; % mass of non-fuel components, kg
MC=52; %mass of center 2x4 m  part, kg
MC0=(pi/8)*MC; % mass of circle (turret) which freely rotates, kg
MC1=MC*(8-pi)/8; %mass of non-turret center part, kg
JC=(MC/12)*(2^2+4^2); %MMOI of the center, kg-m^2
JC0=MC0/2; %MMOI of the turret, kg-m^2
JC1=JC-JC0; %MMOI of the non-turret center, kg-m^2
Ma=(Mbase-MC)/4; % mass of 4 "empty" spaces, kg
Ja=(Ma/12)*(1^2+2^2); %MMOI, kg-m^2
da=sqrt(9.25); % distance to mass a, m
db=sqrt(3.25); % distance to mass b, m
Jbase=JC1+4*Ja+2*Ma*da^2+2*Ma*db^2; %MMOI (no fuel, non-turret), kg-m^2
L13=sqrt(10); %distance to fuel tanks 1 and 3, m
L24=sqrt(6.25); %distance to fuel tanks 2 and 4, m

% Fuel when full is 40 kg, 10 kg/tank
M1=LVL.M1; %mass of fuel in tank 1, kg
M2=LVL.M2; %mass of fuel in tank 2, kg
M3=LVL.M3; %mass of fuel in tank 3, kg
M4=LVL.M4; %mass of fuel in tank 4, kg
JFC=(17*(M1+M3)+8*(M2+M4))/12;
JF=JFC+(M1+M3)*L13^2+(M2+M4)*L24^2;
Xcg=(-3*M1-2*M2+3*M3+2*M4)/(60+M1+M2+M3+M4);
Ycg=(M1-1.5*M2-M3+1.5*M4)/(60+M1+M2+M3+M4);

% Mass Properties at time zero
M=MC+M1+M2+M3+M4+4*Ma;
J=Jbase+JC0+JF+M*(Xcg^2+Ycg^2);

% Mass Properties when full
Mfull=100; %mass, kg
Jfull=250+266+(2/3); %mass moment of inertia, kg-m^2

% Control Limits
NumU=8; % number of controls
Umin=zeros(NumU,1);
Umax=ones(NumU,1)*100;
ULIM=[[Umin Umax];0 0;0 0];

% Limits on Sensor Values
SLIM=[-100 100   %X_m
      -100 100   %Xdt_mps
        -4 4     %Xddt_mps2
      -100 100   %Y_m
      -100 100   %Ydt_mps
        -4 4     %Yddt_mps2
      -600 600   %Theta_deg
      -200 200   %Thetadt_dps
      -360 360]; %Thetaddt_dps2

% Sensor Quantization
SQ=[.005 .01 .004 .005 .01 .004 .02 .01 .4]';

% Sensor Scale Factors
SSF=1./SQ;

% Health Management System Frames to detect failure
if (LVL.SN+sum(abs(LVL.Sfail)))<0.5
    HM_S=120000; %For special case with no noise and no failures
else
    HM_S=250; %Frames at dt0 to detect a sensor failure
end %if
HM_U=500; %Frames at dt0 to detect a thruster failure

% Define Path Points
Pdata=[LVL.P1 LVL.P2 LVL.P3 LVL.P4];
TOLdata=[LVL.P1tol LVL.P2tol LVL.P3tol LVL.P4tol];
PTvec=[Pdata(:,1);Pdata(:,2);Pdata(:,3);Pdata(:,4)
    TOLdata(:,1);TOLdata(:,2);TOLdata(:,3);TOLdata(:,4)];

%Order to go to the points
% Students will remove this once they have their interface working
% Porder=[1 2 3 4]; 
% Porder=[1 2 4 3]; 
% Porder=[1 4 3 2]; 
% Porder=[1 3 2 4]; 
% Porder=[2 3 1 4]; 
% Porder=[2 4 1 3]; 
% Porder=[2 1 4 3]; 
% Porder=[3 2 1 4]; 
% Porder=[3 2 4 1]; 
% Porder=[3 1 2 4]; 
% Porder=[4 3 2 1]; 
% Porder=[4 3 1 2]; 
% Porder=[4 2 1 3]; 
% Porder=[4 2 3 1]; 
Porder=[4 1 2 3]; 

% Call PlotS3D with initial values
PlotS3D([zeros(11,1);0.1*[M1;M2;M3;M4];PTvec;zeros(8,1);0;zeros(8,1);...
    zeros(9,1)]);
