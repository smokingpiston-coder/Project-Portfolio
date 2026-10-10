clc
clear
close all

power_ice = 300
% Power request script
p_demand = linspace(0,power_ice,11); % [kW]
w_array = linspace(1000,6000,80); % [rpm]

T_req = torque_request(p_demand,w_array); % [Nm]

%optimal points table
best_w = [1000,1380,2013,2456,2899,3342,3848,4500,4987,5177]; %[rpm]
best_T = [286,415,427,466,494,514,521,512,517,553]; % [Nm]

% plot
plot_operating_point(power_ice,T_req,w_array,best_w,best_T,p_demand)

% power = 24
% w_opt = interp1(p_demand(2:end),best_w,power,"linear")
% T_opt = interp1(p_demand(2:end),best_T,power,"linear")


% Egu efficiency
% Fuel power vs indicated torque
bsfc = [295,270,265,257,265,284,307,330,350,360] * (1/(3600e6)); %[kg/J]
LHV = 42.7e6; % [j/kg]
gen_efficiency = 0.9; % Assumed constant generator efficiency

% ICE Power [W]
p_ice = (best_w * 2 * pi / 60) .* best_T;

% Fuel Power [W]
p_fuel = bsfc .* p_ice * LHV;

% ICE Efficiency
eta_ice = p_ice ./ p_fuel;

% Total Efficiency (ice + gen)
eta_total = eta_ice * gen_efficiency;

% Plot Results
figure;
plot(p_ice / 1000, eta_total * 100, 'o-', 'LineWidth', 2, 'MarkerSize', 6); % ICE Power in kW
xlabel('Egu power (kW)');
ylabel('Total Efficiency (%)');
ylim([0,max(eta_total*100)+10])
xlim([0,max(p_demand)])
title('Total Efficiency of ICE and Generator');
grid on;

%n = egu_efficiency(T_req,w_array,bsfc,p_demand,LHV)
