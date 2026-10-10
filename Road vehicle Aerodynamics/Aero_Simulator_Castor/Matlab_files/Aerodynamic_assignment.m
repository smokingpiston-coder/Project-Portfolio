% Problem 2
% With no Aero package
% Load Data - No Aero Package
data = load("DRIVER1_No_Aero 2.mat");
lat_acc_noAero = data.lateral_acceleration;
velocity_noAero = data.velocity;
time_noAero = data.time;

% Apply Moving Average Filter
window_size = 5; 
lat_acc_smooth_noAero = movmean(lat_acc_noAero, window_size);
velocity_smooth_noAero = movmean(velocity_noAero, window_size);

% Identify Steady-State Condition
threshold = 0.5;
steady_state_indices_noAero = [false; abs(diff(lat_acc_smooth_noAero)) < threshold];

% Extract Max and Min Lateral Acceleration in Steady-State Condition
lat_acc_steady_noAero = lat_acc_smooth_noAero(steady_state_indices_noAero);
velocity_steady_noAero = velocity_noAero(steady_state_indices_noAero);
time_steady_noAero = time_noAero(steady_state_indices_noAero);

[max_lat_acc_noAero, idx_noAero] = max(lat_acc_steady_noAero);
[min_lat_acc_noAero, idx_min_noAero] = min(lat_acc_steady_noAero);

% Corresponding velocity and time for Max/Min Lateral Acc
max_velocity_noAero = velocity_steady_noAero(idx_noAero);
min_velocity_noAero = velocity_steady_noAero(idx_min_noAero);
time_max_noAero = time_steady_noAero(idx_noAero);
time_min_noAero = time_steady_noAero(idx_min_noAero);

% Load Data - With Aero Package
data = load("DRIVER1_Aero 2.mat");
lat_acc_with_Aero = data.lateral_acceleration;
velocity_with_Aero = data.velocity;
time_with_Aero = data.time;

% Apply Moving Average Filter
lat_acc_smooth_with_Aero = movmean(lat_acc_with_Aero, window_size);
velocity_smooth_with_Aero = movmean(velocity_with_Aero, window_size);

% Identify Steady-State Condition
steady_state_indices_with_Aero = [false; abs(diff(lat_acc_smooth_with_Aero)) < threshold];

% Extract Max and Min Lateral Acceleration in Steady-State Condition
lat_acc_steady_with_Aero = lat_acc_smooth_with_Aero(steady_state_indices_with_Aero);
velocity_steady_with_Aero = velocity_with_Aero(steady_state_indices_with_Aero);
time_steady_with_Aero = time_with_Aero(steady_state_indices_with_Aero);

[max_lat_acc_with_Aero, idx_with_Aero] = max(lat_acc_steady_with_Aero);
[min_lat_acc_with_Aero, idx_min_with_Aero] = min(lat_acc_steady_with_Aero);

% Corresponding velocity and time for Max/Min Lateral Acc
max_velocity_with_Aero = velocity_steady_with_Aero(idx_with_Aero);
min_velocity_with_Aero = velocity_steady_with_Aero(idx_min_with_Aero);
time_max_with_Aero = time_steady_with_Aero(idx_with_Aero);
time_min_with_Aero = time_steady_with_Aero(idx_min_with_Aero);

% Create a figure with two subplots
figure;

% Subplot 1: Lateral Acceleration vs Time
subplot(2,1,1);
plot(time_noAero, lat_acc_smooth_noAero, 'b', 'LineWidth', 1.5);
hold on;
plot(time_with_Aero, lat_acc_smooth_with_Aero, 'r', 'LineWidth', 1.5);

xlabel('Time (sec)');
ylabel('Lateral Acceleration (m/s²)');
title('Lateral Acceleration vs Time (Steady-State)');
legend('No Aero', 'With Aero', 'Max/Min Lat Acc (No Aero)', 'Max/Min Lat Acc (With Aero)');
grid on;
hold off;

% Subplot 2: Velocity vs Time
subplot(2,1,2);
plot(time_noAero, velocity_smooth_noAero, 'b', 'LineWidth', 1.5);
hold on;
plot(time_with_Aero, velocity_smooth_with_Aero, 'r', 'LineWidth', 1.5);

xlabel('Time (sec)');
ylabel('Velocity (m/s)');
title('Velocity vs Time (Steady-State)');
legend('No Aero', 'With Aero', 'Max/Min Vel (No Aero)', 'Max/Min Vel (With Aero)');
grid on;
hold off;



%% Problem 5

% Define constants
m = 1300;   % kg
mu = 1.5;
g = 9.81;
rho = 1.205;
minus_C_LA_Package = 4.0;
minus_C_LA_min = -0.4; 

% Define corner radii range
CR = 50:10:300; % Cornering radius values

% Initialize results structures
results = struct();
results_min = struct();

% Loop to calculate theoretical velocity for C_LA_Package
V_values = zeros(1, length(CR)); % Preallocate for efficiency
for i = 1:length(CR)
    Corner_Rad = CR(i);
    
    % Theoretical velocity calculation
    V = ((mu * m * g) ./ ((m ./ Corner_Rad) - mu * 0.5 * rho * (minus_C_LA_Package)));
    Theoretical_Velocity = sqrt(V);
    
    results(i).Theoretical_Velocity = Theoretical_Velocity;
    V_values(i) = Theoretical_Velocity; % Store values for plotting
end

% Loop to calculate theoretical velocity for C_LA_min
V_min_values = zeros(1, length(CR)); % Preallocate
for j = 1:length(CR)
    Corner_Rad = CR(j);
    
    % Theoretical velocity calculation
    V_min = ((mu * m * g) ./ ((m ./ Corner_Rad) - mu * 0.5 * rho * (minus_C_LA_min)));
    Theoretical_Velocity_min = sqrt(V_min);
    
    results_min(j).Theoretical_Velocity_min = Theoretical_Velocity_min;
    V_min_values(j) = Theoretical_Velocity_min; % Store values for plotting
end

% Plot the results
figure;
plot(CR, V_values, 'b', 'LineWidth', 2, 'MarkerSize', 6); hold on;
plot(CR, V_min_values, 'r', 'LineWidth', 2, 'MarkerSize', 6);
grid on;

% Labels and title
xlabel('Cornering Radius (m)');
ylabel('Theoretical Velocity (m/s)');
title('Theoretical Velocity vs Cornering Radius');
legend('-C_{L}A = 4.0', '-C_{L}A = -0.4', 'Location', 'best');

% Display theoretical velocities
fprintf("\nTheoretical Velocities for -C_L*A_Package (4.0):\n");
disp(V_values);
fprintf("\nTheoretical Velocities for -C_L*A_min (-0.4):\n");
disp(V_min_values);







