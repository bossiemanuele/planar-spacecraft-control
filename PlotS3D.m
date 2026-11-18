function [y]=PlotS3D(u)
% This function draws the spacecraft and the four COMM points
% u is a vector of input data
% u(1) is the x location of the centroid in meters
% u(2) is the y location of the centroid in meters
% u(3) is theta, the orientation angle in radians
% u(4:11) are the values of the 8 thruster commands in Newtons
% u(12:15) are the values of fuel remaining in tanks 1 through 4 in kg
% u(16:18) define COMM point 1 [x,y,theta]
% u(19:21) define COMM point 2 [x,y,theta]
% u(22:24) define COMM point 3 [x,y,theta]
% u(25:27) define COMM point 4 [x,y,theta]
% u(28:30) define the tolerances on COMM point 1 [x,y,theta]
% u(31:33) define the tolerances on COMM point 2 [x,y,theta]
% u(34:36) define the tolerances on COMM point 3 [x,y,theta]
% u(37:39) define the tolerances on COMM point 4 [x,y,theta]
% u(40:47) determine if the satellite has established or completed
%          communication at each of the 4 COMM points
% u(48) simulation time in seconds
% u(49:56) failure bit for thrusters 1 to 8
% u(57:65) failure bit for sensors 1 to 9

% Define persistent variables which will be remembered when the function is
% called again
persistent first HV XV YV tt aa at TSIG ...
    XC YC XF1 YF1 XF2 YF2 XF3 YF3 XF4 YF4 XT1 YT1 XT2 YT2 XT3 YT3 ...
    XT4 YT4 XT5 YT5 XT6 YT6 XT7 YT7 XT8 YT8 XTF1 YTF1 XTF2 YTF2 ...
    XTF3 YTF3 XTF4 YTF4 XTF5 YTF5 XTF6 YTF6 XTF7 YTF7 XTF8 YTF8 ...
    H00 H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 ...
    H17 H18 H19 H20 H21 H22 H23 H24 H25 H26 H27 H28 H29 H30 H31 H32 ...
    H33 H34 H35 
% The variable first is used to initialize many variables
if isempty(first)
    first=1;
else
    first=0;
end %check for 1st call

y=0; % dummy output

% Parse the input vector
xc=u(1); % x position of the centroid 
yc=u(2); % y position of the centroid
tht=u(3); % theta angle
TV=min(1,max(0,u(4:11))); %thrust commands limited 0 to 1
FF=min(1,max(0,u(12:15))); % fuel remaining in each tank, limited 0 to 1
PP=u(40:47); % COMM data for each point [OK, DONE]

% For the first call, define the shape of the vehicle, draw the components
% and define handles
if first
    % Define Handles to reuse in future calls
    HV=[{'H00'},{'H01'},{'H02'},{'H03'},{'H04'},{'H05'},{'H06'},{'H07'},...
        {'H08'},{'H09'},{'H10'},{'H11'},{'H12'},{'H13'},{'H14'},{'H15'},...
        {'H16'},{'H17'},{'H18'},{'H19'},{'H20'},{'H21'},{'H22'},{'H23'},...
        {'H24'},{'H25'},{'H26'},{'H27'},{'H28'},{'H29'},{'H30'},{'H31'},...
        {'H32'},{'H33'},{'H34'},{'H35'}];
    XV=[{'XC'},{'XF1'},{'XF2'},{'XF3'},{'XF4'},{'XT1'},{'XT2'},{'XT3'},...
        {'XT4'},{'XT5'},{'XT6'},{'XT7'},{'XT8'},{'XTF1'},{'XTF2'},{'XTF3'},...
        {'XTF4'},{'XTF5'},{'XTF6'},{'XTF7'},{'XTF8'}];
    YV=[{'YC'},{'YF1'},{'YF2'},{'YF3'},{'YF4'},{'YT1'},{'YT2'},{'YT3'},...
        {'YT4'},{'YT5'},{'YT6'},{'YT7'},{'YT8'},{'YTF1'},{'YTF2'},{'YTF3'},...
        {'YTF4'},{'YTF5'},{'YTF6'},{'YTF7'},{'YTF8'}];
    % Define alpha, which sets the transparency (1=opaque, 0=transparent)
    tt=0.5; %size of the drawn thrusters
    aa=0.9; % alpha for a full fuel tank
    at=0.9; % alpha for a thrust flames
    ac=0.8; % alpha for the COMM points
    TSIG=[-1 -1 1 1 1 -1 -1 1]; %Signs for thrust directions, body-axis
    % Center Body coordinates
    XC=[0 8 8 0]-4;
    YC=[0 0 4 4]-2;
    % Fuel tank coordinates
    XF1=[0 2 2 0]-4;
    YF1=[2 2 4 4]-2;
    XF2=[0 4 4 0]-4;
    YF2=[0 0 1 1]-2;
    XF3=[6 8 8 6]-4;
    YF3=[0 0 2 2]-2;
    XF4=[4 8 8 4]-4;
    YF4=[3 3 4 4]-2;
    % Thruster coordinates
    XT1=[0 -tt -tt]-4;
    YT1=[3 3+tt 3-tt]-2;
    XT2=[0 -tt -tt]-4;
    YT2=[1 1+tt 1-tt]-2;
    XT3=[8 8+tt 8+tt]-4;
    YT3=[1 1+tt 1-tt]-2;
    XT4=[8 8+tt 8+tt]-4;
    YT4=[3 3+tt 3-tt]-2;
    XT5=[1 1+tt 1-tt]-4;
    YT5=[4 4+tt 4+tt]-2;
    XT6=[1 1+tt 1-tt]-4;
    YT6=[0 0-tt 0-tt]-2;
    XT7=[7 7+tt 7-tt]-4;
    YT7=[0 0-tt 0-tt]-2;
    XT8=[7 7+tt 7-tt]-4;
    YT8=[4 4+tt 4+tt]-2;
    % Thruster flames coordinates
    XTF1=[0 0 0]-tt-4;
    YTF1=[3+tt/2 3 3-tt/2]-2;
    XTF2=[0 0 0]-tt-4;
    YTF2=[1+tt/2 1 1-tt/2]-2;
    XTF3=[0 0 0]+tt+4;
    YTF3=[1+tt/2 1 1-tt/2]-2;
    XTF4=[0 0 0]+tt+4;
    YTF4=[3+tt/2 3 3-tt/2]-2;
    XTF5=[1+tt/2 1 1-tt/2]-4;
    YTF5=[0 0 0]+tt+2;
    XTF6=[1+tt/2 1 1-tt/2]-4;
    YTF6=[0 0 0]-tt-2;
    XTF7=[7+tt/2 7 7-tt/2]-4;
    YTF7=[0 0 0]-tt-2;
    XTF8=[7+tt/2 7 7-tt/2]-4;
    YTF8=[0 0 0]+tt+2;
    % set background color to the blackness of space
    % warning('off','MATLAB:whitebg:WhitebgWillBeRemoved');
    blkwhitebg('k');
    % Draw the body
    H00=fill(XC,YC,[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
    % Set up axes
    axis([-20 20 -20 20])
    axis('equal')
    % axis([-25 25 -20 20])
    a=axis;
    axis(a)
    grid on
    hold on
    alpha(H00,0.8);
    % Draw the fuel tanks
    H01=fill(XF1,YF1,'m','EdgeColor','m');
    alpha(H01,aa);
    H02=fill(XF2,YF2,'m','EdgeColor','m');
    alpha(H02,aa);
    H03=fill(XF3,YF3,'m','EdgeColor','m');
    alpha(H03,aa);
    H04=fill(XF4,YF4,'m','EdgeColor','m');
    alpha(H04,aa);
    % Draw the thrusters
    H05=fill(XT1,YT1,[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
    H06=fill(XT2,YT2,[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
    H07=fill(XT3,YT3,'w','EdgeColor','w');
    H08=fill(XT4,YT4,'w','EdgeColor','w');
    H09=fill(XT5,YT5,[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
    H10=fill(XT6,YT6,[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
    H11=fill(XT7,YT7,[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
    H12=fill(XT8,YT8,[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
    % Draw the thruster flames
    H13=fill(XTF1,YTF1,[1 .5 0],'EdgeColor',[1 .5 0]);
    alpha(H13,at);
    H14=fill(XTF2,YTF2,[1 .5 0],'EdgeColor',[1 .5 0]);
    alpha(H14,at);
    H15=fill(XTF3,YTF3,[1 .5 0],'EdgeColor',[1 .5 0]);
    alpha(H15,at);
    H16=fill(XTF4,YTF4,[1 .5 0],'EdgeColor',[1 .5 0]);
    alpha(H16,at);
    H17=fill(XTF5,YTF5,[1 .5 0],'EdgeColor',[1 .5 0]);
    alpha(H17,at);
    H18=fill(XTF6,YTF6,[1 .5 0],'EdgeColor',[1 .5 0]);
    alpha(H18,at);
    H19=fill(XTF7,YTF7,[1 .5 0],'EdgeColor',[1 .5 0]);
    alpha(H19,at);
    H20=fill(XTF8,YTF8,[1 .5 0],'EdgeColor',[1 .5 0]);
    alpha(H20,at);
    % Put a + at the centroid
    H21=plot(0,0,'k+','MarkerSize',8);
    % Set text of points
    H22=text(-25,22,'P1');
    H23=text(-20,22,'P2');
    H24=text(-15,22,'P3');
    H25=text(-10,22,'P4');
    H26=text(5,22,['T: ' num2str(120-round(u(48)*10)/10)]);
    % Set text of sensor fail lights
    % H27=text(26,18,'S1');
    % H28=text(26,15,'S2');
    % H29=text(26,12,'S3');
    % H30=text(26,9,'S4');
    % H31=text(26,6,'S5');
    % H32=text(26,3,'S6');
    % H33=text(26,0,'S7');
    % H34=text(26,-3,'S8');
    % H35=text(26,-6,'S9');
    H27=text(33,18,'S1');
    H28=text(33,15,'S2');
    H29=text(33,12,'S3');
    H30=text(33,9,'S4');
    H31=text(33,6,'S5');
    H32=text(33,3,'S6');
    H33=text(33,0,'S7');
    H34=text(33,-3,'S8');
    H35=text(33,-6,'S9');
    % Define the data for the 4 COMM points
    P1=u(16:18);
    P2=u(19:21);
    P3=u(22:24);
    P4=u(25:27);
    P1Tol=u(28:30);
    P2Tol=u(31:33);
    P3Tol=u(34:36);
    P4Tol=u(37:39);
    X1=-P1Tol(1):0.001:P1Tol(1);
    X2=-P2Tol(1):0.001:P2Tol(1);
    X3=-P3Tol(1):0.001:P3Tol(1);
    X4=-P4Tol(1):0.001:P4Tol(1);
    Y1P=sqrt(P1Tol(2)^2.*(1-(X1.^2)./P1Tol(1)^2));
    Y2P=sqrt(P2Tol(2)^2.*(1-(X2.^2)./P2Tol(1)^2));
    Y3P=sqrt(P3Tol(2)^2.*(1-(X3.^2)./P3Tol(1)^2));
    Y4P=sqrt(P4Tol(2)^2.*(1-(X4.^2)./P4Tol(1)^2));
    X1=X1+P1(1);
    X2=X2+P2(1);
    X3=X3+P3(1);
    X4=X4+P4(1);
    Y1N=-Y1P+P1(2);
    Y2N=-Y2P+P2(2);
    Y3N=-Y3P+P3(2);
    Y4N=-Y4P+P4(2);
    Y1P=Y1P+P1(2);
    Y2P=Y2P+P2(2);
    Y3P=Y3P+P3(2);
    Y4P=Y4P+P4(2);
    % Plot COMM points
    HP1=fill([X1 X1(end:-1:1)],[Y1P Y1N(end:-1:1)],'r','EdgeColor','r');
    alpha(HP1,ac);
    plot([P1(1)+4*cos((P1(3)+P1Tol(3))*pi/180) P1(1) ...
        P1(1)+4*cos((P1(3)-P1Tol(3))*pi/180)], ...
        [P1(2)+4*sin((P1(3)+P1Tol(3))*pi/180) P1(2) ...
        P1(2)+4*sin((P1(3)-P1Tol(3))*pi/180)],'w');
    HP2=fill([X2 X2(end:-1:1)],[Y2P Y2N(end:-1:1)],'y','EdgeColor','y');
    alpha(HP2,ac);
    plot([P2(1)+4*cos((P2(3)+P2Tol(3))*pi/180) P2(1) ...
        P2(1)+4*cos((P2(3)-P2Tol(3))*pi/180)], ...
        [P2(2)+4*sin((P2(3)+P2Tol(3))*pi/180) P2(2) ...
        P2(2)+4*sin((P2(3)-P2Tol(3))*pi/180)],'w');
    HP3=fill([X3 X3(end:-1:1)],[Y3P Y3N(end:-1:1)],'g','EdgeColor','g');
    alpha(HP3,ac);
    plot([P3(1)+4*cos((P3(3)+P3Tol(3))*pi/180) P3(1) ...
        P3(1)+4*cos((P3(3)-P3Tol(3))*pi/180)], ...
        [P3(2)+4*sin((P3(3)+P3Tol(3))*pi/180) P3(2) ...
        P3(2)+4*sin((P3(3)-P3Tol(3))*pi/180)],'w');
    HP4=fill([X4 X4(end:-1:1)],[Y4P Y4N(end:-1:1)],'c','EdgeColor','c');
    alpha(HP4,ac);
    plot([P4(1)+4*cos((P4(3)+P4Tol(3))*pi/180) P4(1) ...
        P4(1)+4*cos((P4(3)-P4Tol(3))*pi/180)], ...
        [P4(2)+4*sin((P4(3)+P4Tol(3))*pi/180) P4(2) ...
        P4(2)+4*sin((P4(3)-P4Tol(3))*pi/180)],'w');
end %first

% Define rotation matrix
R=[cos(tht) -sin(tht);sin(tht) cos(tht)];

% Set position of vehicle
for idx=1:13
    eval(['xt1=' XV{idx} ';']);
    eval(['yt1=' YV{idx} ';']);
    Pdata=R*[xt1;yt1];
    xt2=Pdata(1,:)'+xc;
    yt2=Pdata(2,:)'+yc;
    eval(['set(' HV{idx} ',''XData'',xt2);']);
    eval(['set(' HV{idx} ',''YData'',yt2);']);
end % idx

% Set fuel tank density
for idx=2:5
    if FF(idx-1)>0
        eval(['set(' HV{idx} ',''FaceAlpha'',' num2str(min(1,max(0,FF(idx-1)*aa))) ');']);
        eval(['set(' HV{idx} ',''EdgeColor'',''m'');']);
    else
        eval(['set(' HV{idx} ',''FaceAlpha'',' num2str(0) ');']);
        eval(['set(' HV{idx} ',''EdgeColor'',''k'');']);
    end
end % idx

% Set the thrust size
for idx=14:17
    eval(['xt1=' XV{idx} ';']);
    eval(['yt1=' YV{idx} ';']);
    Pdata=R*[xt1+[0 3*tt*TV(idx-13)*TSIG(idx-13) 0];yt1];
    xt2=Pdata(1,:)'+xc;
    yt2=Pdata(2,:)'+yc;
    eval(['set(' HV{idx} ',''XData'',xt2);']);
    eval(['set(' HV{idx} ',''YData'',yt2);']);
    if TV(idx-13)<0.01
        eval(['set(' HV{idx} ',''EdgeColor'',''k'');']);
    else
        eval(['set(' HV{idx} ',''EdgeColor'',[1 .5 0]);']);
    end
end % idx
for idx=18:21
    eval(['xt1=' XV{idx} ';']);
    eval(['yt1=' YV{idx} ';']);
    Pdata=R*[xt1;yt1+[0 3*tt*TV(idx-13)*TSIG(idx-13) 0]];
    xt2=Pdata(1,:)'+xc;
    yt2=Pdata(2,:)'+yc;
    eval(['set(' HV{idx} ',''XData'',xt2);']);
    eval(['set(' HV{idx} ',''YData'',yt2);']);
    if TV(idx-13)<0.01
        eval(['set(' HV{idx} ',''EdgeColor'',''k'');']);
    else
        eval(['set(' HV{idx} ',''EdgeColor'',[1 .5 0]);']);
    end
end % idx

% Set Background on COMM Points
% Yellow if communication established
% Green if communication completed
% Black not currently communicating, not completed
cnt=0;
for jdx=2:2:8
    cnt=cnt+1;
    if PP(jdx)>0.5
        eval(['set(' HV{22+cnt} ',''BackgroundColor'',''g'');']);
    elseif PP(jdx-1)>0.5
        eval(['set(' HV{22+cnt} ',''BackgroundColor'',''y'');']);
    else
        eval(['set(' HV{22+cnt} ',''BackgroundColor'',''k'');']);
    end % if 
end %jdx

% Set edge color of thrusters if failed
for jdx=1:8
    if u(48+jdx)>0.5
        eval(['set(' HV{5+jdx} ',''EdgeColor'',''c'');']);
%         eval(['set(' HV{5+jdx} ',''FaceColor'',[1 .5 0]);']);
    end %if
end %jdx

% Set background color of sensors for failures
for jdx=1:9
    if u(56+jdx)>0.5
        eval(['set(' HV{27+jdx} ',''BackgroundColor'',''r'');']);
    else
        eval(['set(' HV{27+jdx} ',''BackgroundColor'',''g'');']);
    end %if
end %jdx

% Position Centroid Cursor 
eval(['set(' HV{22} ',''XData'',xc);']);
eval(['set(' HV{22} ',''YData'',yc);']);

% Update Time
set(H26,'String',['T: ' num2str(120-round(u(48)*10)/10)]);

drawnow
