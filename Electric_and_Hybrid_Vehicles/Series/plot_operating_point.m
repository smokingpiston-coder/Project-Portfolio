function plot_operating_point(ice_power,T_req,w_array,best_w,best_T,p_demand)
%PLOT_OPERATING_POINT Summary of this function goes here
%   Detailed explanation goes here

% Plot the ICE characteristics
plotICE(ice_power, 1, T_req, w_array*60/(2*pi), 100);
hold on;

% Plot required torque vs. speed
plot(w_array, T_req, 'b', 'LineWidth', 1);
hold on

% Highlight the current operating point
plot(best_w, best_T,'g',Marker='o',LineStyle='none',LineWidth=1,MarkerFaceColor='g');

% Add labels, legend, and grid
xlabel('Speed (RPM)');
ylabel('Torque (Nm)');
legend(['P = ' num2str(p_demand(2:end)) ' kW'], 'Location', 'best');

grid on;
hold off;
end

