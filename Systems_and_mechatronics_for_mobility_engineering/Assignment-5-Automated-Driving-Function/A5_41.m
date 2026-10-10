%% You are supposed to fill this template. Remember not to change variable names! 
% When you run this file, you should see all these variables in the Workspace with
% the right values! 
clear;
close all;

%% Vehicle data
% Insert group number for individual parameters: 
group_number = 41;   % Numeric value corresponding to your group number on Canvas

data = A5_datagen(group_number);        % Generate individual data
m = data(1);                            % Vehicle mass [kg]
J = data(2);                            % Vehicle inertia (around z-axis) [kgm^2]
c1 = data(3);                           % Front wheel cornering stiffness [kgm/s^2]
c2 = data(4);                           % Rear wheel cornering stiffness [kgm/s^2]
a = data(5);                            % Front axle wheel to center of gravity [m]
b = data(6);                            % Rear axle wheel to center of gravity [m]
tau = data(7);                          % Actuator tine constant [s]
k1 = data(8);                            % Front axle wheel to center of gravity [m]

% Sampling time
h=0.01;                             % Sampling time [s]

%% Problem 1 - Implement simulink model
V_x = 20;

% Equation for vehicle’s position in Y direction
%d Y = V_x*sin(psi)+vy*cos(psi);

% Equation for Lateral velocity
% d_vy = (-(c1+c2)/(m*V_x))*vy + (((-a*c1+b*c2)/(m*V_x))-V_x)*yaw_rate + (c1/m)*delta;

% Equation for Heading Angle
% d_psi = integral(yaw_rate);

% Equation for Yaw Rate
% d_Yaw_rate= (-(a*c1-b*c2)/(J*V_x))*vy +(-(a^2*c1+b^2*c2)/(J*V_x))*yaw_rate + ((a*c1)/J)*delta;

% Equation for Steering Angle
%d_delta = -1/tau*(delta-(1/2*arctan((k1/V_x)*u)));


%% Problem 2 - Linearization

A_lin = [0  1  V_x  0  0;  0  -(c1+c2)/(m*V_x)  0  ((-a*c1+b*c2)/(m*V_x))-V_x  c1/m; 0 0 0 1 0; 0  -(a*c1-b*c2)/(J*V_x)  0  -(a^2*c1+b^2*c2)/(J*V_x)  (a*c1)/J; 0 0 0 0 -1/tau];
B_lin = [0; 0; 0; 0; k1/(2*tau*V_x)];

%% Problem 3 - Reachable

A = [0  1  V_x  0  0;  0  -(c1+c2)/(m*V_x)  0  ((-a*c1+b*c2)/(m*V_x))-V_x  c1/m; 0 0 0 1 0; 0  -(a*c1-b*c2)/(J*V_x)  0  -(a^2*c1+b^2*c2)/(J*V_x)  (a*c1)/J; 0 0 0 0 -1/tau];
B = [0; 0; 0; 0; k1/(2*tau*V_x)];


Wr = [B, A*B, A^2*B, A^3*B, A^4*B];
disp(Wr);
rank(Wr);
disp('The rank of Wr:');
disp(rank(Wr));

Reach_3 = 'Yes';                    % Answer with Reach_3 = 'Yes' or Reach_3 = 'No'                         

%% Problem 4 - Control design

A = [0  1  V_x  0  0;  0  -(c1+c2)/(m*V_x)  0  ((-a*c1+b*c2)/(m*V_x))-V_x  c1/m; 0 0 0 1 0; 0  -(a*c1-b*c2)/(J*V_x)  0  -(a^2*c1+b^2*c2)/(J*V_x)  (a*c1)/J; 0 0 0 0 -1/tau];
B = [0; 0; 0; 0; k1/(2*tau*V_x)];
C_Y = [1, 0, 0, 0, 0];


p1 = 2.9;
p2 = 2*p1;

S1=((3*p2)+(2*p1));
S2=(3*p2^2)+(6*p1*p2)+(p1^2);
S3=(p2^3)+(6*p1*(p2^2))+(3*(p1^2)*p2);
S4=(2*p1*(p2^3))+(3*(p1^2)*(p2^2));
S5=(p1^2)*(p2^3);
S=[S1 S2 S3 S4 S5];

temp=poly(A);
Wrtilde=inv([1 temp(2) temp(3) temp(4) temp(5); ...
    0 1 temp(2) temp(3) temp(4); ...
    0 0 1 temp(2) temp(3); ...
    0 0 0 1 temp(2); ...
    0 0 0 0 1]);

K = [S1-temp(2) S2-temp(3) S3-temp(4) S4-temp(5) S5-temp(6)]*Wrtilde*inv(Wr);
disp(K);
kr = (-1)/(C_Y*inv(A-B*K)*B);
disp(kr);

%% Problem 5 - Observable
% True or false, answer with a vector [x;x;x;x;x], where X is either 1
% (true) of 0 (false). First element is for x1, and so on

A = [0  1  V_x  0  0;  0  -(c1+c2)/(m*V_x)  0  ((-a*c1+b*c2)/(m*V_x))-V_x  c1/m; 0 0 0 1 0; 0  -(a*c1-b*c2)/(J*V_x)  0  -(a^2*c1+b^2*c2)/(J*V_x)  (a*c1)/J; 0 0 0 0 -1/tau];

% To measure observability for Y-position
C_Y = [1, 0, 0, 0, 0];
Wo_Y = [C_Y; C_Y*A; C_Y*A^2; C_Y*A^3; C_Y*A^4];
det(Wo_Y);
rank(Wo_Y);
disp(rank(Wo_Y));

% To measure observability for lateral position
C_vy = [0, 1, 0, 0, 0];
Wo_vy = [C_vy; C_vy*A; C_vy*A^2; C_vy*A^3; C_vy*A^4];
det(Wo_vy);
rank(Wo_vy);
disp(rank(Wo_vy));

% To measure observability for Heading angle
C_H = [0, 0, 1, 0, 0];
Wo_H = [C_H; C_H*A; C_H*A^2; C_H*A^3; C_H*A^4];
det(Wo_H);
rank(Wo_H);
disp(rank(Wo_H));

% To measure observability for Yaw Rate
C_YR = [0, 0, 0, 1, 0];
Wo_YR = [C_YR; C_YR*A; C_YR*A^2; C_YR*A^3; C_YR*A^4];
det(Wo_YR);
rank(Wo_YR);
disp(rank(Wo_YR));

% To measure observability for Steering angle
C_delta = [0, 0, 0, 0, 1];
Wo_delta = [C_delta; C_delta*A; C_delta*A^2; C_delta*A^3; C_delta*A^4];
det(Wo_delta);
rank(Wo_delta);
disp(rank(Wo_delta));

Obsv_vec = ['1';'0';'0';'0';'0'];

%% Problem 6 - Estimator design poles

% Consider the fastest state feedback pole that is p2 = 5.8

% observer pole should be 5 times faster then the feedback poles.

p_est = p2*5;

%% Problem 7 - Estimator design
A = [0  1  V_x  0  0;  0  -(c1+c2)/(m*V_x)  0  ((-a*c1+b*c2)/(m*V_x))-V_x  c1/m; 0 0 0 1 0; 0  -(a*c1-b*c2)/(J*V_x)  0  -(a^2*c1+b^2*c2)/(J*V_x)  (a*c1)/J; 0 0 0 0 -1/tau];
C_Y = [1, 0, 0, 0, 0];

Q = [-p_est, -p_est, -p_est, -p_est, -p_est];
L= acker(A', C_Y', Q)';
disp(L);


% Verify the eigenvalues of (A - L * C_Y) to ensure they match the desired poles
eigenvalues = eig(A - L * C_Y);
disp('Eigenvalues of the matrix:');
disp(eigenvalues);
 
%% Problem 8 - Discretization

A = [0  1  V_x  0  0;  0  -(c1+c2)/(m*V_x)  0  ((-a*c1+b*c2)/(m*V_x))-V_x  c1/m; 0 0 0 1 0; 0  -(a*c1-b*c2)/(J*V_x)  0  -(a^2*c1+b^2*c2)/(J*V_x)  (a*c1)/J; 0 0 0 0 -1/tau];
B = [0; 0; 0; 0; k1/(2*tau*V_x)];
H = 0.01;    % Sampling time
C_Y = [1, 0, 0, 0, 0];
D = 0;

% Discretize A system matrix using Euler Method
  A_d = eye(size(A)) + H*(A-(L.*C_Y));
  disp(A_d);

% Discretize B input matrix using Euler Method  
  B_d = B * H;

% Discretize the Observer gain  
 L_d = L * H;

% The Observer poles using  Euler method
  Observer_poles = eig(A_d);

p_est_d = Observer_poles;
 % The results
 disp('Poles of the discretize observer:');
 disp(p_est_d);

%% Problem 9 - Implement observer in 0.5002
% Refer the Simulink model, SimOut = sim("A5_model_1.slx", 'StopTime', '10');
Simout= sim("A5_model_1.slx",'StopTime', '10');
t=Simout.Scope_x1.time;
t0=5;
y=Simout.Scope_x1.signals.values;
y0=0;
yf=3.5;
y_norm =(y-y0)/(yf-y0);
t_norm = t-t0;
S1 = stepinfo(y_norm,t_norm,"SettlingTimeThreshold",0.05);
disp(S1);

%% Problem 10 - Statements
% True or false, answer with a vector [x;x;x;x], where X is either 1
% (true) of 0 (false)

% Consider the mass of the vehicle 
m_10 = m+400;
V_10 = 30;
J_10 = m_10*a*b;

Simout = sim("A5_model_10.slx",'StopTime', '10');
x=Simout.Scope_x1.time;
x0=5;
z=Simout.Scope_x1.signals.values;
z0=0;
zf=3.5;
z_norm =(z-z0)/(zf-z0);
x_norm = x-x0;
S2 = stepinfo(z_norm,x_norm,"SettlingTimeThreshold",0.05);
disp(S2);

TF_vec = [0 ; 0 ; 1 ; 1];

%% Problem 11 - Vehicle stability

m_10 = m+400;
V_11 = 27;
J_10 = 5220;
v_unstable = '27m/s';

