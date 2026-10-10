%% You are supposed to fill this template. Remember not to change variable names! 
% When you run this file, you should see all these variables in the Workspace with
% the right values! 
clear;
clc;
close all;

%% Assignment data
% Insert group number for individual parameters: 
group_number = 14;

data = A2_datagen(14);    % Generate individual data

y=data.y;                           % Step response data for identifaction of tire parameters
t=data.t;                           % time

mc=data.mc;                         % Quarter car mass [kg]
mw=data.mw;                         % Wheel mass [kg]
ds=data.ds;                         % Suspension damping coefficient [Ns/m]
cs=data.cs;                         % Suspension spring coefficient [N/m]


%% Problem 1 

% Transfer function 
transfer_func = '(cw+dw*s)/((mw*s^2)+(dw*s)+cw)';

% Example: transfer_func = 'G(s)=(K)/(Ts+1)';
% Will be corrected using the report

%% Problem 2 
% Identify the tire parameters 

i= stepinfo(y,t,'SettlingTimeThreshold',0.05);
Mp= i.Peak-1;

zeta=-log(Mp)/(pi*sqrt(1+(-log(Mp)/pi)^2));

peak_top=t(y==max(y));

peak_bottom=t(y==min(y(t>0.05)));

deltaT=(peak_bottom-peak_top-0.005); %-0.005 is too make the graph and transfer funktion look the same

omega_n = pi/deltaT*sqrt(1-zeta^2);

cw=(omega_n^2)*mw
dw=zeta*2*sqrt(cw*mw)

%cw = 2.2696e+05;
%dw = 1.1404e+03;

%s=tf([1 0],[0 1])
%transfer_func = (cw)/((mw*s^2)+(dw*s)+cw);
%step(transfer_func)


%% Problem 3 
% What is the maximum movement of the chassis (absolute value)? 
% When, approximately, has the suspension returned to its steady state value (settling time)?



A3 = [0 1 0 0 ; -(cw+cs)/mw -(dw+ds)/mw (cs/mw) (ds/mw) ; 0 0 0 1 ; (cs/mc) (ds/mc) -(cs/mc) -(ds/mc)]
B3 = [0 ; cw/mw ; 0 ; 0]
C3 = [1 0 0 0 ; 0 0 1 0]
D3 = [0 ; 0]

sim('A2_suspension14.slx'); %Run the simulink

position_wheel= Wheel_data(:, 2);
position_chassis= chassis_data(:, 2);
time_chassis=chassis_data(:, 1);
time_wheel=Wheel_data(:, 1);

max_position_chassis=max(position_chassis)
max_position_wheel=max(position_wheel);

info = stepinfo(position_chassis, time_chassis, 'SettlingTimeThreshold', 0.05);
info_wheel = stepinfo(position_wheel, time_wheel, 'SettlingTimeThreshold', 0.05);

settling_time = info.SettlingTime
settling_time_wheel = info_wheel.SettlingTime;

%max_value = 0.0592;
%settling_time = 1.6253;


%% Problem 4
% Determine the eigenvalues of the system! Is the system stable?

A3 = [0 1 0 0 ; -(cw+cs)/mw -(dw+ds)/mw (cs/mw) (ds/mw) ; 0 0 0 1 ; (cs/mc) (ds/mc) -(cs/mc) -(ds/mc)];
eigenvalues = eig(A3)

if all(real(eigenvalues) < 0)
    disp('System is stable (all the eigenvalues have negative real parts).');
else
    disp('System is unstable (some of the eigenvalues have a positiv real part/parts).');
end

eig_a = '-1.4157 + 0.0000i';
eig_b = '-0.1592 + 0.1045i';
eig_c = '-0.1592 - 0.1045i';
eig_d = '--0.0347 + 0.0000i';

% Uncomment the true statement
stable = 'The system is stable';
%stable = 'The system is unstable';

%% Problem 5
% By changing the damping coefficient and spring coefficient of the suspension system different behaviors of the system's transient response can be observed. 

% What conclusion can you draw from the placement of the poles of the system?

% Uncomment the true statement
p5 = 'If the imaginary part is larger than the real part, the more oscillatory the system response becomes.';
%p5 = 'If the real part is larger than the imaginary part, the more oscillatory the system response becomes.';
%p5 = 'The location of the poles does not matter, as long as the poles are stable.';


%% Problem 6
% Transformation matrix

T = [1 0 0 0; 0 1 0 0; 1 0 -1 0; 0 1 0 -1]

%% Problem 7
% Augment the model output with the chassis acceleration and the relative
% distance between road and wheel.


C = [1 0 0 0; 0 0 1 0; cs/mc ds/mc -cs/mc -ds/mc; 1 0 0 0]                     
D = [0; 0; 0; -1]

%% Problem 8
% Optimal parameter setting for supsension system to maximize road handling
% and ride comfort performance.


ds_values = 500:500:10000;    % Damping coefficient range
cs_values = 10000:5000:60000; % Spring coefficient range

optimal_ds = 0;
optimal_cs = 0;
min_road_handling = Inf;

for ds = ds_values
    for cs = cs_values
    
        assignin('base', 'ds', ds);
        assignin('base', 'cs', cs);

        sim('A2_suspension14.slx');

        relativ_disp_log = evalin('base', 'relativ_displacement');
        chassis_acceleration_log = evalin('base', 'chassi_acceleration');
       
        time = relativ_disp_log(:, 1);
        relative_displacement = abs(relativ_disp_log(:, 2));
        chassi_acceleration = chassis_acceleration_log(:, 2);
       
       
        if max(abs(chassi_acceleration)) <= 15
            
            road_handling = trapz(time(1:end-1), relative_displacement(1:end-1));
            
            if road_handling < min_road_handling
                min_road_handling = road_handling;
                optimal_ds = ds;
                optimal_cs = cs;
            end
        end
    end
end

fprintf('The optimal damping coefficient (ds) is: %.2f Ns/m\n', optimal_ds);
fprintf('The optimal spring coefficient (cs) is: %.2f N/m\n', optimal_cs);

   
%ds_opt = 2500.00 Ns/m;
%cs_opt = 10000.00 N/m;


%% Problem 9
% Active suspension system. Extend the model with an actuator.

A_active = '[0 1 0 0 0; -(cw+cs)/mw -(dw+ds)/mw cs/mw ds/mw 1/mw; 0 0 0 1 0; cs/mc ds/mc -cs/mc -ds/mc -1/mc; 0 0 0 0 -1/zeta]';
B_active = '[0; 0; 0; 0; 1/zeta]';
H_active = '[0; cw/mw; 0; 0; 0]';