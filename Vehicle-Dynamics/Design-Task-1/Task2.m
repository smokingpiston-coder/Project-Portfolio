
%% Task 2 : Vehicle Model
clear all; close all; clc;

% Known terms
syms M g h l_r l_f L Rair F_air_fz F_air_rz S_fx S_rx J_w RRC R_f R_r T_f T_r theta

% M = Mass of the vehicle
% g Gravitional force constant
% h = height of the COG
% l_f = Distance between centre of front wheel to COG
% l_r = Distance between centre of rear wheel to COG
% L = Wheel base
% Rair = longitudinal aerodynamic force
% F_air _fz = Air lift force over the front axle
% F_air_rz = Air lift force over the rear axle
% S_fx = relation between slip and normalized longitudinal front tyre force
% S_rx = relation between slip and normalized longitudinal rear tyre force
% J_w = Moment of inertia for 2 wheels and axle
% RRC = Rolling resistance coefficient 
% R_f = front tyre radius
% R_r = rear tyre radius
% T_f = Torque on the front wheel
% T_r = Torque on the rear wheel
% theta = inclination angle

% Unkown terms
syms v_dot w_f w_r F_fx F_rx F_fz F_rz 

% % When the vehicle is driving on the horizonatal road(No slope)
% % Vehicle Longitudinal force
% eqn1 = M*v_dot == F_fx + F_rx - Rair - M*g;
% 
% % Normal forces acting on the vehicle
% eqn2 = F_fz + F_air_fz + F_rz + F_air_rz == M*g;
% 
% % Moment about point A(on the front wheel)
% eqn3 = (F_rz + F_air_rz)*L == M*v_dot*h + M*g*l_f + Rair*h + M*g*h;
% 
% % Tractive force on the front wheel
% eqn4 = F_fx == S_fx*F_fz;
% eqn5 = F_rx == S_rx*F_rz;
% 
% % Wheels rotational forces
% eqn6 = T_f - F_fx*R_f - F_fz*RRC*R_f == J_w*w_f;
% eqn7 = T_r - F_rx*R_r - F_rz*RRC*R_r == J_w*w_r;

% Solution = solve([eq1, eq2, eq3, eq4, eq5, eq6, eq7], [v_dot, F_rz, F_fz, F_fx, F_rx, w_f, w_r]);
% disp('Solution:');
% disp(Solution);

% When the vehicle is driving up the road with gradient
% Vehicle Longitudinal force
eqn1 = M*v_dot == F_fx + F_rx - Rair - M*g*sin(theta);

% Normal forces acting on the vehicle
eqn2 = F_fz + F_air_fz + F_rz + F_air_rz == M*g*cos(theta);

% Moment about point A(on the front wheel)
eqn3 = (F_rz + F_air_rz)*L == M*v_dot*h + M*g*cos(theta)*l_f + Rair*h + M*g*sin(theta)*h;

% Tractive force on the front wheel
eqn4 = F_fx == S_fx*F_fz;
eqn5 = F_rx == S_rx*F_rz;

% Wheels rotational forces
eqn6 = T_f - F_fx*R_f - F_fz*RRC*R_f == J_w*w_f;
eqn7 = T_r - F_rx*R_r - F_rz*RRC*R_r == J_w*w_r;

Solution = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6, eqn7], [v_dot, F_rz, F_fz, F_fx, F_rx, w_f, w_r]);

disp('v_dot solution:');
disp(Solution.v_dot);
disp('F_rz solution:');
disp(Solution.F_rz);
disp('F_fz solution:');
disp(Solution.F_fz);
disp('F_fx solution:');
disp(Solution.F_fx);
disp('F_rx solution:');
disp(Solution.F_rx);
disp('w_f solution:');
disp(Solution.w_f);
disp('w_r solution:');
disp(Solution.w_r);