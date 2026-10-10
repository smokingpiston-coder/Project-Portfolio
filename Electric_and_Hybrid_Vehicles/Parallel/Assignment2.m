
%%Define power array for the Electric Motor
p_demand = linspace(0,16,9); % [kW]
w_array = linspace(0,5700,80); % [rpm]

%TORQUE_REQUEST
    
T = zeros(1,length(w_array));
for i= 1:length(p_demand)
    for j = 1:length(w_array)
       T(i,j) = (p_demand(i)*10^3)/(w_array(j)*2*pi/60);       
    end
end

% remove first line with power = 0
T_req = T(2:end,:);


% Plot the EM characteristics
plotEM(16, T_req, w_array*60/(2*pi));
hold on;

% Plot required torque vs. speed
plot(w_array, T_req, 'b', 'LineWidth', 1);
hold on

% Highlight the current operating point picked manually based on best
% efficiency of the EM
best_w = [3201,2963,2903,2903,2903,2844,2784,2546];
best_T = [5.96,12.89,19.03,26.3,32.88,40.28,48,59];
plot(best_w, best_T,'g',Marker='o',LineStyle='none',LineWidth=1,MarkerFaceColor='g');

% Add labels, legend, and grid
xlabel('Speed (RPM)');
ylabel('Torque (Nm)');
legend(['P = ' num2str(p_demand(2:end)) ' kW'], 'Location', 'best');

grid on;
hold off;
