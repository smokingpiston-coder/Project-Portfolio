%% You are supposed to fill this template. Remember not to change variable names! 
% When you run this file, you should see all these variables in the Workspace with
% the right values! 
clear;
close all;

%% Vehicle data
% Insert group number for individual parameters: 
group_number = 41;   % Numeric value corresponding to your group number on Canvas

data = A3_datagen(41);        % Generate individual data
m = data(1);                            % Vehicle mass [kg]
k = data(2);                            % Engine torque gain [Nm/rad]
tau = data(3);                          % Engine time constant [s]
r_gear = data(4);                       % Gear ratio [-]
r_w = data(5);                          % Wheel radius [m]
C_D = data(6);                          % Air drag coefficient [-]
A_f = data(7);                          % Frontal area [m^2]
f = data(8);                            % Rolling resistance coefficient [1]

g = 9.82;                                % Gravitational constant [m/s^2]
rho = 1.2;                               % Air density [kg/m^2]

%% Problem 1 - Equilibrium point!

% The equation is derived in the report;

x1_e = 2550;             % Ex. x1_e = -14,               
x2_e = 15;                            
u_e = 0.1448;                              
alpha_e = 0;                       


%% Problem 2 - Linearized state space model!

A_lin = [-1/tau 0; 1/m -rho*C_D*A_f*x2_e/m];
B_lin = [k*r_gear/tau*r_w; 0];
C_lin = [0 1];
H_lin = [0; -g*f];
                    


%% Problem 3 - Reachability matrix

Wr = [(k*r_gear)/(tau*r_w) -(k*r_gear)/(tau^2*r_w) ; 0  (k*r_gear)/(m*tau*r_w)];

% The reachability matrix Wr has rank 2, which means the system is reachable. 
% Wr is not equal to zero.

%% Problem 4 - State feedback controller
% a(s)=s^2+2*zeta*w_n*s+w_n^2, where w_n=0.6 and zeta=1/sqrt(2)

%state space matrices are
A_lin = [-1/tau 0; 1/m -((rho*C_D*A_f*x2_e)/m)];
B_lin = [(k*r_gear)/(tau*r_w); 0];


zeta = 1/sqrt(2);
w_n = 0.6;

% Desired poles for the closed-loop system
 pol = [1, 2*zeta*w_n, w_n^2];

desired_poles=roots(pol);

% State feedback gain
K=place(A_lin, B_lin, desired_poles);

% The results
disp('State feedback gain K:');
disp(K);

K = [ -0.000018331318429,  0.342167704930532];


%% Problem 5 - Reference gain

% Reference gain 
kr = -1/(C_lin*(A_lin-B_lin*K)^-1*B_lin);

% The results
fprintf('Reference gain kr:');
disp(kr);

kr = 0.342902822262105

%% Problem 6 - Performance measures

SimOut = sim('A3_model_cc.slx', 'StopTime','30');
t=SimOut.speed.time;
t0=5;
s=SimOut.speed.signals.values;
s0=15;
sf=20;
y_norm = (s-s0)/(sf-s0);
t_norm = t-t0;
S=stepinfo(y_norm,t_norm,'SettlingTimeThreshold',0.005)

RiseTime_6 = 3.577437562979291;
SettlingTime_6 = 11.691512983610954;
Overshoot_6 = 4.319346630539322;



%% Problem 7 - Augmented system model

A_aug = [-1/tau 0 0 ; 1/m  -(rho*C_D*A_f*x2_e)/m  0 ; 0 1 0];
B_aug = [(k*r_gear)/(r_w*tau) ; 0 ; 0];
F_aug = [0 ; 0 ; -1];                    


%% Problem 8 - State feedback controller with integral action

%A_aug = [-1/tau 0 0 ; 1/m  -(rho*C_D*A_f*x2_e)/m 0 ; 0 1 0];
%B_aug = [(k*r_gear)/(r_w*tau) ; 0 ; 0];

zeta = 1/sqrt(2);
w_n = 0.6;

% Desired poles
desired_poles= [-0.6 + 1j*0.424, -0.6 - 1j*0.424, -1.8];


%gain
K_aug = place(A_aug, B_aug, desired_poles);
format long

%The results
disp('gain:K_aug');
disp(K_aug);

K_aug = [0.000079462857141, 2.571858424587528, 0.927433309066289];





%% Problem 9 - Performance measures

SimOut=sim("A3_model_cc_prob_9.slx", 'StopTime', '70');
t = SimOut.speed.time;
t0 = 5;
y = SimOut.speed.signals.values;
y0 = 15;
yf = 20;
y_norm = (y - y0)/(yf - y0);
t_norm = t - t0;
S = stepinfo(y_norm , t_norm, 'SettlingTimeThreshold', 0.05);
disp(S);


RiseTime_9 = 3.708820041844949;
SettlingTime_9 = 29.728305332160414;
Overshoot_9 = 1.015425253479352;


%% Problem 10 - Sensitivity to parameter uncertainty 
% Decrease (more than 10%), Not affected (<10%), Increase (more than 10%), answer with a vector [x;x;x], where X is either -1
% (decreased), 0 (not affected) or 1 (increased)

% m is the nominal mass       
 m;

% m_increase 50% increase the mass
m_increase = 1.5*m;          

SimOut=sim("A3_model_cc_41", 'StopTime', '70');
t = SimOut.speed.time;
t0 = 5;
y = SimOut.speed.signals.values;
y0 = 15;
yf = 20;
r_norm = (y - y0)/(yf - y0);
t_norm = t - t0;
S=stepinfo(r_norm , t_norm ,'SettlingTimeThreshold', 0.05);
disp(S);

RiseTime_10 = 3.715625316558095;
SettlingTime_10 = 31.179099563864760;
Overshoot_10 = 8.241077564062159;

% error is the relative change;
error_R = ((RiseTime_10 - RiseTime_9) / RiseTime_9)*100;      
error_S = ((SettlingTime_10 - SettlingTime_9) / SettlingTime_9)*100;
error_O = (Overshoot_10 - Overshoot_9)

% The results
fprintf('Relative change in RiseTime_10: %.2f%%\n', error_R);
fprintf('Relative change in Overshoot_10: %.2f%%\n', error_O);
fprintf('Relative change in SettlingTime_10: %.2f%%\n', error_S);

% Check if the changes are Increased, Decreased or Not affected (greater than ±5%)
if abs(error_R) >+5 
    fprintf('The change in rise time is Increased.\n');
elseif error_R >= -5 && error_R <= +5
    fprintf('The change in rise time is Not Affected.\n');
elseif (error_R)<-5
    fprintf('The change in rise time is Decreased.\n');
end

if abs(error_O) >+5
    fprintf('The change in overshoot is increased.\n');
elseif error_O >= -5 && error_O <= +5
    fprintf('The change in overshoot is Not Affected.\n');
elseif (error_O)<-5
    fprintf('The change in overshoot is Decreased.\n');
end


if abs(error_S) >+5
    fprintf('The change in settling time is increased.\n');
elseif error_S >= -5 && error_S <= +5
    fprintf('The change in settling time is Not Affected.\n');
elseif (error_S)<-5
    fprintf('The change in settling time is Decreased.\n');
end

%The 'change in rise time is Not Affected;
%The change in overshoot is increased;
%The change in settling time is increased;
Ans_vec = [0;0;1];                % [RiseTime, SetlingTime, Overshoot]



