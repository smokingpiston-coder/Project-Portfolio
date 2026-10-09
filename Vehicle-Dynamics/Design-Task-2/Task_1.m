% Steady state cornering equation

syms m vx vy C_f C_r l_f l_r delta w F_fx



% Equilibriul forces action perpendicular to the longitudinal forces
eq1 = w*(m*vx + (C_f*l_f - C_r*l_r)/vx) + vy*((C_f + C_r)/vx) == (C_f + F_fx)*delta;

% Moment Equilibrium about Centre of mass 
eq2 = vy*((C_r*l_r - C_f*l_f)/vx) - w*((C_f*l_f^2 + C_r*l_r^2)/vx) == -l_f*delta*(C_f + F_fx);


Solution = solve([eq1, eq2], [vy, w]);
disp('Solution:');
disp(Solution);

%% Task 1.2, 1.3, 1.4 Determine the under steer gradient, critical and characteristics speeds and the Steering Wheel Angle

% Vehicle data
m = 1675;            % Mass of the vehicle[Kg]
g = 9.81;            % Gravitional force
L = 2.675;           % Wheel base[meter]
steer_ratio = 15.9   % Steering ratio
c0 = 30.7;           % Tyre stiffness parameter
c1 = -0.00235;       % Tyre stiffness parameter
ay = 4;              % lateral acceleration (m/s^2)
vx = 100/3.6;        % speed(km/h)
R = vx^2/ay;     % radius of curvature


% Load cases
lf_cases = [0.37*L , 0.63*L, 0.47*L];
results = struct();

for i = 1:(length(lf_cases))
    lf = lf_cases(i);
    lr = L - lf;

   % Force acting on each wheel
   Fzf = (L-lf)*m*g/(2*L); 
   Fzr = lf*m*g/(2*L);

  % Cornering stiffness
  Cf = (c0*Fzf + c1*Fzf^2)*2;
  Cr = (c0*Fzr + c1*Fzr^2)*2;

  % For understeer gradient
  ku = m*((Cr*lr - Cf*lf)/(Cf*Cr*L));

  % critical and charateristics speed
  v_critical_speed = 0;
  v_char_speed = 0;

  if ku < 0
  v_critical_speed = sqrt(L/-ku);
  else
  v_char_speed = sqrt(L/ku);
  end

  % Steering wheel angle
  steering_wheel_angle = ((L/R) + (ku * vx^2/R))*(180/pi)*steer_ratio;

  results(i).lf = lf;
  results(i).lr = lr;
  results(i).Fzf = Fzf;
  results(i).Fzr = Fzr;
  results(i).Cf = Cf;
  results(i).Cr = Cr;
  results(i).ku = ku;
  results(i).v_critical_speed = v_critical_speed;
  results(i).v_char_speed = v_char_speed;
  results(i).steering_wheel_angle = steering_wheel_angle;
end

for i = 1:3;
    fprintf('Load case %d:\n',i);
    fprintf('lf: %.3f m\n', results(i).lf);
    fprintf('lr: %.3f m\n', results(i).lr);
    fprintf('Fzf: %.3f N\n', results(i).Fzf);
    fprintf('Fzr: %.3f N\n', results(i).Fzr);
    fprintf('Cf: %.3f N/rad\n', results(i).Cf);
    fprintf('Cr: %.3f N/rad\n', results(i).Cr);
    fprintf('Understeer Gradient: %.4f\n', results(i).ku);
    fprintf('Critical Speed: %.4f m/s\n', results(i).v_critical_speed);
    fprintf('Characteristics Speed: %.4f m/s\n', results(i).v_char_speed);
    fprintf('Steering Wheel Angle: %.3f degree\n', results(i).steering_wheel_angle);
end



%% Task 1.5 Steering wheel angle for varying operating point

R_1_5 = 200;              %Radius of curve [meters]            



lf_cases = [0.37*L , 0.63*L, 0.47*L];  % Load cases 1, 2, 3
V_speed = linspace(0/3.6, 200/3.6, 100);
labels = ["load case 1", "load case 2", "load case 3"];
colors = ['r','g','b'];

delta_s = zeros(length(lf_cases), length(V_speed));

for k = 1:(length(lf_cases))
    lf = lf_cases(k);
    lr = L - lf;

   % Force acting on each wheel
   Fzf = (L-lf)*m*g/(2*L); 
   Fzr = lf*m*g/(2*L);

   % Cornering stiffness
   Cf = (c0*Fzf + c1*Fzf^2)*2;
   Cr = (c0*Fzr + c1*Fzr^2)*2;

   % For understeer gradient
   ku = m*((Cr*lr - Cf*lf)/(Cf*Cr*L));

    for j = 1:(length(V_speed))
        vx = V_speed(j);
        delta_f = ((L/R_1_5) + (ku * vx^2/R_1_5));
        delta_s(k,j)= delta_f * steer_ratio;
    end
    % Display steering wheel angles (converted to degrees)
    disp(['Delta_s for Load Case ', num2str(k), ':']);
    disp(delta_s(k, :) * (180/pi)); % Convert to degrees and display
end


% plot results
figure;
hold on;
for k = 1:(length(lf_cases))
    plot(V_speed*3.6, delta_s(k,1:100)*(180/pi), colors(k), 'DisplayName', labels(k));
end
hold off;

% plot formatting
xlabel('Speed (km/h)');
ylabel('Steering wheel angle (degree)');
title('Steering wheel angle vs Speed');
grid on;

%% Task 5.3 Documentation in assignment report
% Brake 1
data = load('Group_5_braket1.mat');
accelerationLocal_1 = data.accelerationLocal
ay_1 = accelerationLocal_1(:,2);
stw_1 = data.delta;
plot(stw_1,ay_1, 'b', 'Linewidth', 1.5)
hold on;

yline(0, 'k--', 'Linewidth', 1.5);
xline(0,'k--', 'LineWidth', 1.5);

xlabel('Steering angle(deg)');
ylabel('Lateral Acceleration(m/s^2)');
title('Steering angle vs Lateral acceleration')
grid on;
hold off;

%%  Brake 2 
data =load('Group_5_braket2.mat');
accelerationLocal_2 = data.accelerationLocal
ay_2 = accelerationLocal_2(:,2);
stw_2 = data.delta;
plot(stw_2,ay_2,'r', 'LineWidth',1.5)
hold on

yline(0,'k--', 'LineWidth',1.5);
xline(0,'k--', 'LineWidth',1.5);

xlabel('Steering angle');
ylabel('LAteral acceleration');
title('Steering angle vs Lateral acceleration');
grid on;
hold off;


%%  Brake 3
data = load('Group_5_braket3.mat');
accelerationLocal_3 = data.accelerationLocal
ay_3 = accelerationLocal_3(:,2)
stw_3 = data.delta;
plot(stw_3,ay_3, 'g', 'Linewidth',1.5)
hold on

yline(0, 'k--','LineWidth',1.5);
xline(0, 'k--', 'LineWidth',1.5);

xlabel('Steering angle');
ylabel('Lateral acceleration');
title('Steering angle vs Lateral acceleration');
grid on;
hold off;


%% Skidpad 1
data = load('Group_5_Skidpadt1.mat');
accelerationLocal_5 = data.accelerationLocal;
ay_4 = accelerationLocal_5(:,2);
stw_4 = data.delta;
plot(stw_4,ay_4, 'b', 'LineWidth',1.5)
hold on

yline(0, 'k--', 'LineWidth',1.5);
xline(0, 'k--', 'LineWidth',1.5);

xlabel('Steering angle');
ylabel('Lateral acceleration');
title('Steering angle vs Lateral acceleration');
grid on;
hold off;



%% Skidpad 2
data = load('Group_5_Skidpadt2.mat');
accelerationLocal_5 = data.accelerationLocal;
ay_5 = accelerationLocal_5(:,2);
stw_5 = data.delta;
plot(stw_5,ay_5,'b','LineWidth',1.5)
hold on

yline(0, 'k--', 'LineWidth',1.5);
xline(0, 'k--', 'LineWidth',1.5);

xlabel('Steering angle');
ylabel('Lateral acceleration');
title('Steering anlge vs Lateral acceleration');
grid on;
hold off;
%% Skidpad 1 Position 1

data = load('Group_5_Skidpadt1.mat');
Position = data.position;
Position_x = Position(:,1);
Position_y = Position(:,2);
plot(Position_x,Position_y,'b','LineWidth',1.5)
hold on

yline(0, 'k--', 'LineWidth',1.5);
xline(0, 'k--', 'LineWidth',1.5);

xlabel('Positon(X)');
ylabel('Position(Y)');
title('Positon(X) vs Position(Y)');
grid on;
hold off;
%% Skidpad 2 Position 2
data = load('Group_5_Skidpadt2.mat');
Position = data.position;
Position_x = Position(:,1);
Position_y = Position(:,2);
plot(Position_x,Position_y,'b','LineWidth',1.5)
hold on

yline(0, 'k--', 'LineWidth',1.5);
xline(0, 'k--', 'LineWidth',1.5);

xlabel('Positon(X)');
ylabel('Position(Y)');
title('Positon(X) vs Position(Y)');
grid on;
hold off;




















