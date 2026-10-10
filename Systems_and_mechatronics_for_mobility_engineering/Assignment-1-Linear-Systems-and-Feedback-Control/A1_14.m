% You are supposed to fill this template. Remember not to change variable names! 
% When you run this file, you should see all these variables in the Workspace with
% the right values! 



%% Vehicle data
% Insert group number for individual parameters: 
group_number = 14;

data = A1_datagen(group_number);        % Generate individual data
m=data(1);                              % Vehicle mass [kg]
a=data(2);                              % "External force resistance gain" [Ns/m]
b=data(3);                              % "Throttle gain" [N/rads/m]
g=9.82;                                 % Gravitational constant [m/s^2]

% Dummy controller parameters (do not modify at this stage)
Kp = 0;
Ki = 0;

%% Problem 1 - Determine the pole to the system!

p = -a/m;                 % Ex. p = 45;               


%% Problem 2 - Implement model in Simulink!
% Simulate manual driver mode! What is the steady state speed after 100 seconds?

speed_final = 30;


%% Problem 3 - Determine the closed-loop transfer function!

% Not used - include in written report 

%% Problem 4a - Pole placement design
% a) Poles in -0.2 and -0.8

Kp_4a = (m-a)/b;
Ki_4a = (0.16*m)/b;


%% Problem 4b - Pole placement design
% b) Poles in -0.5+- j*sqrt(2)

Kp_4b = (m-a)/b;
Ki_4b = (2.25*m)/b;


%% Problem 5a - Transient response
% a) Poles in -0.2 and -0.8
% Notice that the parameter names for the controller in the Simulink model
% are denoted Kp and Ki

Kp = (m-a)/b;
Ki = (0.16*m)/b;
SimOut=sim('A1_cc','StopTime','20');
t=SimOut.speed.time;
t0=1;
y=SimOut.speed.signals.values;
y0=25;
yf=30;
y_norm = (y-y0)/(yf-y0);
t_norm = t-t0;
S=stepinfo(y_norm,t_norm,'SettlingTimeThreshold',0.05)

RiseTime_5a = 2.0845;
SettlingTime_5a = 2.6392;
Overshoot_5a = 3.5008;



%% Problem 5b - Transient response
% b) Poles in -0.5+- j*sqrt(2)
% Notice that the parameter names for the controller in the Simulink model
% are denoted Kp and Ki
s=0;
Kp = (m-a)/b;
Ki = (2.25*m)/b;
SimOut=sim('A1_cc','StopTime','20');
t=SimOut.speed.time;
t0=1;
y=SimOut.speed.signals.values;
y0=25;
yf=30;
y_norm = (y-y0)/(yf-y0);
t_norm = t-t0;
S=stepinfo(y_norm,t_norm,'SettlingTimeThreshold',0.05)

RiseTime_5b = 0.7111;
SettlingTime_5b = 4.9343;
Overshoot_5b = 40.0275;


%% Problem 6 - Determine transfer!
A =[0 -1; 0 -a/m];
B=[0; b/m];
C=[1 0];
D=0;
Bw=[1; 0];
Dw=0;

% Transfer function from the control input u to the output y
[num_Guy, den_Guy]= ss2tf(A,B,C,D);

% Transfer function from the disturbance input w to the output y
[num_Gwy, den_Gwy]= ss2tf(A,Bw,C,Dw);

% Display the transfer functions
tf_Guy = tf(num_Guy, den_Guy)
tf_Gwy = tf(num_Gwy, den_Gwy)

Guy_num = -5.812;
Guy_den = (s^2)+0.1047*s;
Gwy_num = s+0.1047;
Gwy_den = (s^2)+0.1047*s;


%% Problem 7 - Pole placement design
% Triple pole in -0.2

%Caluculations is seen in the report

Kd_7 = (a-(0.6*m))/b;
Ki_7 = -(0.008*m)/b;
Kp_7 = -(0.12*m)/b;


%% Problem 8 - Transient response
% Notice that the parameter names for the controller in the Simulink model
% are denoted Kp, Ki and Kd

p=0.16045; %CASE a, d=15m
%p=0.09319; %CASE b, d=0m

KP = -(3*p^2*m)/(b);
KI = -(m*p^3)/(b);
KD = -(a+(3*p*m))/(b);

p_15m = 0.16045;         % pole placement for min 15 meter
p_0m = 0.09319;          % pole placement for collision




