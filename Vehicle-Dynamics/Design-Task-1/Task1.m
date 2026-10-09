clear all; close all; clc;

%% Task 1 a)
s_x = linspace(0, 1);  % Usually given by (R.w - v_x)/|R.w|

% Dry surface
road_cond = 1;
dry_forces = arrayfun(@(slip) Sub_magic_tireformula(slip, road_cond), s_x);

% Wet surface
road_cond = 2;
wet_forces = arrayfun(@(slip) Sub_magic_tireformula(slip, road_cond), s_x);

% Ice surface
road_cond = 3;
ice_forces = arrayfun(@(slip) Sub_magic_tireformula(slip, road_cond), s_x);

plot(s_x, dry_forces, 'Color', [0 0 0.5], 'LineWidth', 2.5, 'DisplayName', 'Dry Surface');
hold on;
plot(s_x, wet_forces, 'Color', [0.5 0 0], 'LineWidth', 2.5, 'LineStyle', '--', 'DisplayName', 'Wet Surface');
plot(s_x, ice_forces, 'Color', [0 0.5 0], 'LineWidth', 2.5, 'LineStyle', ':', 'DisplayName', 'Ice Surface');
hold off;
xlabel('Longitudinal Slip');
ylabel('Utilized friction');
title('Longitudinal Forces on Different Road Surfaces');
legend;

%% Task 1 b)
% For experimental data 1
exp_data1_s_x = 0.0:0.05:0.45;
exp_data1_long_tyreF = [0.0, 0.25, 0.53, 0.77, 0.89, 0.95, 0.94, 0.92, 0.90, 0.86];

K = 3*pi/180;

% Parameters for E = 0
C1_E0 = 2.75; 
D1_E0 = 0.94; 
E1 = 0.0;
B1_E0 = atan(K)/(C1_E0*D1_E0);
mu_E1 = arrayfun(@(slip) calculate_mu(D1_E0, C1_E0, B1_E0, E1, slip), exp_data1_s_x);

% Parameters for E = -4.0
C1_E_neg4 = 1.50;
D1_E_neg4 = 0.94;
E2 = -4.0;
B1_E_neg4 = atan(K)/(C1_E_neg4*D1_E_neg4);
mu_E2 = arrayfun(@(slip) calculate_mu(D1_E_neg4, C1_E_neg4, B1_E_neg4, E2, slip), exp_data1_s_x);

figure;
% First subplot: E = 0
subplot(1,2,1);
plot(exp_data1_s_x, exp_data1_long_tyreF, 'o-', 'DisplayName', 'Experimental Data');
hold on;
plot(exp_data1_s_x, mu_E1, 'r-', 'DisplayName', 'Modeled Data (E=0)');
hold off;
xlabel('Longitudinal Slip');
ylabel('Fx/Fz');
title('E = 0 (C1=2.75, D1=0.94)');
legend;

% Second subplot: E = -4.0
subplot(1,2,2);
plot(exp_data1_s_x, exp_data1_long_tyreF, 'o-', 'DisplayName', 'Experimental Data');
hold on;
plot(exp_data1_s_x, mu_E2, 'r-', 'DisplayName', 'Modeled Data (E=-4.0)');
hold off;
xlabel('Longitudinal Slip');
ylabel('Fx/Fz');
title('E = -4.0 (C1=1.5, D1=0.94)');
legend;

% For exp data 2
exp_data2_s_x = 0.5:0.05:0.95;
exp_data2_long_tyreF = [0.85, 0.83, 0.81, 0.80, 0.79, 0.78, 0.77, 0.76, 0.75, 0.74];

% Parameters for E = 0
C2_E0 = 1.60; 
D2_E0 = 0.85; 
E1 = 0.0;
B2_E0 = atan(K)/(C2_E0*D2_E0);
mu_E1 = arrayfun(@(slip) calculate_mu(D2_E0, C2_E0, B2_E0, E1, slip), exp_data2_s_x);

% Parameters for E = -4.0
C2_E_neg4 = 1.55;
D2_E_neg4 = 0.99;
E2 = -4.0;
B2_E_neg4 = atan(K)/(C2_E_neg4*D2_E_neg4);
mu_E2 = arrayfun(@(slip) calculate_mu(D2_E_neg4, C2_E_neg4, B2_E_neg4, E2, slip), exp_data2_s_x);

figure;
% First subplot: E = 0
subplot(1,2,1);
plot(exp_data2_s_x, exp_data2_long_tyreF, 'o-', 'DisplayName', 'Experimental Data');
hold on;
plot(exp_data2_s_x, mu_E1, 'r-', 'DisplayName', 'Modeled Data (E=0)');
hold off;
xlabel('Longitudinal Slip');
ylabel('Fx/Fz');
title('E = 0 (C1=1.6, D1=0.85)');
legend;

% Second subplot: E = -4.0
subplot(1,2,2);
plot(exp_data2_s_x, exp_data2_long_tyreF, 'o-', 'DisplayName', 'Experimental Data');
hold on;
plot(exp_data2_s_x, mu_E2, 'r-', 'DisplayName', 'Modeled Data (E=-4.0)');
hold off;
xlabel('Longitudinal Slip');
ylabel('Fx/Fz');
title('E = -4.0 (C1=1.55, D1=0.99)');
legend;

function mu = calculate_mu(D, C, B, E, slip)
    mu = D*sin(C*atan(B*slip*100-E*(B*slip*100-atan(B*slip*100))));
end


