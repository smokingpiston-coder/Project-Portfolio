%% You are supposed to fill this template. Remember not to change variable names! 
% When you run this file, you should see all these variables in the Workspace with
% the right values! 
clear;
close all;

%% Vehicle data
% Insert group number for individual parameters: 
group_number = 41;

data = A4_datagen(group_number);        % Generate individual data
J_f = data(1);                          % Engine inertia [kgm^2]
J_c = data(2);                          % Chassis inertia [kgm^2]
r_gear = data(3);                       % Gear ratio [-]
d_s = data(4);                          % Driveshaft damping coefficient [Nms/rad]
c_s = data(5);                          % Driveshaft spring coefficient [Nm/rad]

%% Problem 1 - Observable 1 - wheel speed!
A = [-d_s/(J_f*r_gear^2)  d_s/(J_f*r_gear)  -c_s/(J_f*r_gear); d_s/(J_c*r_gear)  -d_s/J_c  c_s/J_c;  1/r_gear  -1  0];
B = [1/J_f ; 0 ; 0];
C = [0 1 0];
Wo_1 = [C; C*A; C*A^2];
disp(Wo_1);


% Determinent Matrix
det(Wo_1);
rank(Wo_1);


Obsv_1 = 'Yes';   % Answer with Obsv_1 = 'Yes' or Obsv_1 = 'No
             

%% Problem 2 - Observable 2 - engine speed!
% Observable from engine speed or torsion?
% To check observability from engine speed
C_eng = [1 0 0];
A = [-d_s/(J_f*r_gear^2)  d_s/(J_f*r_gear)  -c_s/(J_f*r_gear); d_s/(J_c*r_gear)  -d_s/J_c  c_s/J_c;  1/r_gear  -1  0];
Wo_eng = [C_eng; C_eng*A; C_eng*A^2];
disp(Wo_eng);


% To check observability from Torsion
C_tor = [0 0 1];
Wo_tor = [C_tor; C_tor*A; C_tor*A^2];
disp(Wo_tor);

% Find the det of the matrices;
det(Wo_eng);
rank(Wo_eng);
det(Wo_tor);
rank(Wo_tor);


Obsv_eng = 'Yes';                    % Answer with Obsv_eng = 'Yes' or Obsv_eng = 'No'                         
Obsv_tor = 'No';                    % Answer with Obsv_tor = 'Yes' or Obsv_tor = 'No'


%% Problem 3 - Observable 3 - driveshaft torque!

% T_shaft = c_s * x_3 + d_s*(x_1 - x_2); The common relation for T_shaft;

C_3 = [d_s/r_gear  -d_s  c_s]; 
disp(C_3);

% Wo_C_3 is the observability Matrix;
C_3*A;          % Multiply C_3 by A matrix;
C_3*A^2;        %  Multiply C_3 by A^2 matrix; 

Wo_C_3 = [C_3; C_3*A ; C_3*A^2];

% Find the det of the matrices;
det(Wo_C_3);
rank(Wo_C_3);


Obsv_3 = 'No';                    % Answer with Obsv_3 = 'Yes' or Obsv_3 = 'No'                         

%% Problem 4 - Estimator poles

poles = [-60, -60, -60]; 


%% Problem 5 - Estimator gain matrix

A = [-d_s/(J_f*r_gear^2)  d_s/(J_f*r_gear)  -c_s/(J_f*r_gear); d_s/(J_c*r_gear)  -d_s/J_c  c_s/J_c;  1/r_gear  -1  0];
C_eng;
poles = [-60, -60, -60];
L_pp = acker(A', C_eng', poles);

% Verify the eigenvalues of (A - L_pp * C_eng) to ensure they match the desired poles
eigenvalues = eig(A - L_pp' * C_eng);
disp('Eigenvalues of the matrix:');
disp(eigenvalues);

L_pp =[177.8610; 64.2256;  -1.2881];
L = L_pp        % In Simulink model, the estimator gain is denoted L
disp('The L:');   
disp(L);
%% Problem 6 - Performance measures

SimOut = sim('A4_model_driveline_6', 'StopTime', '10');
Y1 = SimOut.x1_hat.Data;
Y2 = SimOut.x2_hat.Data;
Y3 = SimOut.x3_hat.Data;
T1 = SimOut.x1_hat.Time;
T2 = SimOut.x2_hat.Time;
T3 = SimOut.x3_hat.Time;
S1=stepinfo(Y1,T1,'SettlingTimeThreshold',0.005);
S2=stepinfo(Y2,T2,'SettlingTimeThreshold',0.005');
S3=stepinfo(Y3,T3,0,-0.1,'SettlingTimeThreshold',0.005');

%The results
disp('SettlingTime S1:');
disp(S1);
disp('SettlingTime S2:');
disp(S2);
disp('SettlingTime S3:');
disp(S3);

SettlingTime_6 = '0.2311';  %The SettlingTime considered of S2.


%% Problem 7 - Kalman filtering
A = [-d_s/(J_f*r_gear^2)  d_s/(J_f*r_gear)  -c_s/(J_f*r_gear); d_s/(J_c*r_gear)  -d_s/J_c  c_s/J_c;  1/r_gear  -1  0];
B = [1/J_f ; 0 ; 0];
C_eng = [1 0 0];

%  The covariance matrices
Rw = 10^-3; % Measurement noise covariance
Rv = 1;    % Road disturbance covariance

% The re-scaling of Rv
Rv_scaled = Rv*J_c^2;

% The disturbance matrix.
H = [0; -1; 0];


[P, L, lambda] = icare(A', C_eng', H*Rv_scaled*H',inv(Rw));
L = L';
if all(eig(P) >= 0)
    disp('P is positive semidefinite.');
else
    disp('P is not positive semidefinite.');
end

% The Kalman gain
L_kalman = P * C_eng' / inv(Rw);

%L_kalman = [226.8342; 197.6810;  -1.9560];
%L = L_kalman;   % In Simulink model, the estimator gain is denoted L
%disp('The L:');
%disp(L);
%% Problem 8 - Performance measures

Simout = sim('A4_model_driveline_8.slx','StopTime','10');
E1 = Simout.x1_hat.Data;
E2 = Simout.x2_hat.Data;
E3 = Simout.x3_hat.Data;
F1 = Simout.x1_hat.Time;
F2 = Simout.x2_hat.Time;
F3 = Simout.x3_hat.Time;
P1=stepinfo(E1,F1,'SettlingTimeThreshold',0.005);
P2=stepinfo(E2,F2,'SettlingTimeThreshold',0.005');
P3=stepinfo(E3,F3,0,-0.1,'SettlingTimeThreshold',0.005');

%The results
disp('SettlingTime P1:');
disp(P1);
disp('SettlingTime P2:');
disp(P2);
disp('SettlingTime P3:');
disp(P3);


SettlingTime_8 = 0.2586;

%% Problem 9 - Tuning of Kalman filter

%  The covariance matrices
Rw = 10^-3; % Measurement noise covariance
Rv = 100;    % Road disturbance covariance [Rv= 0.01, 0.1, 1, 10 and 100];

Rv_scaled = Rv*J_c^2;

% The disturbance matrix.
H = [0; -1; 0];


[P, L, lambda] = icare(A', C_eng', H*Rv_scaled*H',inv(Rw));
L = L';

% The Kalman gain
L = P * C_eng' / inv(Rw);
%L = [6.581726720102304e+02; 1.983269924359858e+03; -6.295976033890973];
%disp('The L:');
%disp(L);

Simout = sim('A4_model_driveline_9.slx','StopTime','10');
G1 = Simout.x1_hat.Data;
G2 = Simout.x2_hat.Data;
G3 = Simout.x3_hat.Data;
J1 = Simout.x1_hat.Time;
J2 = Simout.x2_hat.Time;
J3 = Simout.x3_hat.Time;
K1=stepinfo(G1,J1,'SettlingTimeThreshold',0.005);
K2=stepinfo(G2,J2,'SettlingTimeThreshold',0.005');
K3=stepinfo(G3,J3,0,-0.1,'SettlingTimeThreshold',0.005');

%The results
disp('SettlingTime K1:');
disp(K1);
disp('SettlingTime K2:');
disp(K2);
disp('SettlingTime K3:');
disp(K3);



R_v = 100;

%% Problem 10 - Statements
% True or false, answer with a vector [x;x;x;x], where X is either 1
% (true) of 0 (false)

   
TF_vec = [0 ; 1 ; 1 ; 0];
