
cells_s = 43
cells_p = 1
V_pack = 3.8*cells_s;       % Battery pack voltage (V)
C_pack = 15*cells_p;        % Battery capacity (Ah)
I_max = 100;        % Maximum current (A)

% Calculations
E_battery = V_pack * C_pack / 1000; % Energy capacity in kWh
P_max = V_pack * I_max / 1000;      % Maximum power in kW

% Display results
disp(['Battery Energy Capacity: ', num2str(E_battery), ' kWh']);
disp(['Maximum Battery Power: ', num2str(P_max), ' kW']);


max_battery_power = 16.34 % [kw]
battery_energy = 2.451 % [kwh]
range = 300 % [km]

total_energy = battery_energy*range