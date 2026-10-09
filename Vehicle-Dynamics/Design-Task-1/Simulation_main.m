% Vehicle Dynamics 2024 HT
% Main file: Simulation_main.m for Assignment 1
%--------------------------------------------------------------------------
% 2012-09-18 by Ulrich Sander
% 2015-10-26 by Pär Pettersson
% 2017-10-30 by Toheed Ghandriz
% 2023-09-04 by Bengt J H Jacobson, Zhaohui Ge 
%--------------------------------------------------------------------------
clear all;      % Clear all variables
close all;      % Close all windows
clc;            % Clear command window

%----Define vehicle parameters---------------------------------------------
CONST = Sub_read_data;

%----Define Drive mode [FWD/RWD/AWD]---------------------------------------
CONST.drive_mode = 1; % torqueRatio: 0 => RWD, 1 => FWD, 2 => AWD

%----Define road condition-------------------------------------------------
roadCondition = 1; % dry=1, wet=2, ice=3 

%----Define slope of road--------------------------------------------------
% Function input
slope = 8*pi/180; % Slope of the road in 8 deg!

%----Task 1: Define initial conditions-------------------------------------
s    = 0;                   % Initial travelled distance
v    = 0.1;                 % Initial velocity
energyf = 0;                % Initial front motor energy consumption
energyr = 0;                % Initial rear motor energy consumption
wf   = (1.05*v)/CONST.R;    % Initial rotational velocity of front wheel
wr   = (1.05*v)/CONST.R;    % Initial rotational velocity of rear wheel
gearf = 1;                  % Intial gear front axle [Only one gear in 2024]
gearr = 1;                  % Intial gear rear axle [Only one gear in 2024]
TCActivef = 0;              % Intial TC active state front axle
TCActiver = 0;              % Intial TC active state rear axle

%----Define timestep and integration time----------------------------------
Tstart = 0;            % Starting t
Tend   = 20;           % Ending t
dt     = 0.0001;       % t step
t=(Tstart:dt:Tend);    % t vector

%----Preallocate arrays for speed------------------------------------------
a_vector=zeros(size(t));
v_vector=zeros(size(t));
s_vector=zeros(size(t));
slipf_vector=zeros(size(t));
slipr_vector=zeros(size(t));
wf_vector=zeros(size(t));
wr_vector=zeros(size(t));
Fzf_vector=zeros(size(t));
Fzr_vector=zeros(size(t));
wdotf_vector=zeros(size(t));
wdotr_vector=zeros(size(t));
Tdrivf_vector=zeros(size(t));
Tdrivr_vector=zeros(size(t));
gearf_vector=zeros(size(t));
gearr_vector=zeros(size(t));
wengf_vector=zeros(size(t));
wengr_vector=zeros(size(t));
TCActivef_vector=zeros(size(t));
TCActiver_vector=zeros(size(t));
powerf_vector=zeros(size(t));
powerr_vector=zeros(size(t));

%----Anti-slip control initialisation--------------------------------------
Fzfapprox = CONST.M*CONST.g*CONST.Lr/CONST.L;
Fzrapprox = CONST.M*CONST.g*CONST.Lf/CONST.L;
mue_step = 0.001;
[mu_vec,surface] = Sub_magic_tireformula(0:mue_step:1,roadCondition);
[mutilmax, idMuMax] = max(mu_vec);
slipopt = idMuMax*mue_step;
Tdrivf_max0 = Fzfapprox*(mutilmax+CONST.f_r)*CONST.R;
Tdrivr_max0 = Fzrapprox*(mutilmax+CONST.f_r)*CONST.R;
Tdrivf_max = Tdrivf_max0;
Tdrivr_max = Tdrivr_max0;

%----Simulation over t-----------------------------------------------------
for i=1:length(t)
    % Simulation of vehicle dynamics based on full throttle Calculate Tdriv,
    % gear and engine speed
    [TfCap,TrCap,gearf,gearr,wengf,wengr]=Sub_drivetrain(wf,wr,gearf,gearr,CONST);
    
    % Calcultate slip
    slipf=Sub_wheel_slip(v,wf,CONST);
    slipr=Sub_wheel_slip(v,wr,CONST);

    % Update of the discrete state TCAct...
    if (not(TCActivef)) && (slipf > slipopt)
        TCActivef = 1;
    elseif TCActivef && (TfCap < Tdrivf_max)
        TCActivef = 0;
    end

    if (not(TCActiver)) && (slipr > slipopt)
        TCActiver = 1;
    elseif TCActiver && (TrCap < Tdrivr_max)
        TCActiver = 0;
    end

    % Calculate wheel torque based on Traction Control Active state 
    if TCActivef
        Tdrivf = min(TfCap,Tdrivf_max);
    else
        Tdrivf = TfCap;
    end

    if TCActiver
        Tdrivr = min(TrCap,Tdrivr_max);
    else
        Tdrivr = TrCap;
    end
      

    % Vehicle dynamic model
    [a,wdotf,wdotr,Fzf,Fzr]=Sub_vehicle_dynamics(...
            v,Tdrivf,Tdrivr,slipf,slipr,slope,roadCondition,CONST);

    % Update variables based on new vehicle model states
    % Max. drive torques based on optimal slip
    Tdrivf_max = Fzf*(mutilmax+CONST.f_r)*CONST.R; 
    Tdrivr_max = Fzr*(mutilmax+CONST.f_r)*CONST.R;
    % Power consumptions
    powerf=Tdrivf*wf;
    powerr=Tdrivr*wr;

    % Updating the distance, velocity, rotational velocity, power and
    % energy consumption
    s=s+v*dt;
    v=v+a*dt;
    wf=wf+wdotf*dt;
    wr=wr+wdotr*dt;   

    % Saving result in vector at position i
    a_vector(i)=a;
    v_vector(i)=v;
    s_vector(i)=s;
    slipf_vector(i)=slipf;
    slipr_vector(i)=slipr;
    wf_vector(i)=wf;
    wr_vector(i)=wr;
    Fzf_vector(i)=Fzf;
    Fzr_vector(i)=Fzr;
    wdotf_vector(i)=wdotf;
    wdotr_vector(i)=wdotr;
    Tdrivf_vector(i)=Tdrivf;
    Tdrivr_vector(i)=Tdrivr;
    gearf_vector(i)=gearf;
    gearr_vector(i)=gearr;
    wengf_vector(i)=wengf;
    wengr_vector(i)=wengr;
    TCActivef_vector(i)=TCActivef;
    TCActiver_vector(i)=TCActiver;
    powerf_vector(i)=powerf;
    powerr_vector(i)=powerr;
end

%----Plot the results------------------------------------------------------
Sub_plot(t,a_vector,v_vector,s_vector,Tdrivf_vector,Tdrivr_vector,...
    Fzf_vector,Fzr_vector,slipf_vector, slipr_vector,gearf_vector, ...
    gearr_vector,wengf_vector,wengr_vector);

%% Task 4
% Calculate power consumption of the battery for front and rear motors
P_battery_f = powerf_vector / 0.85;
P_battery_r = powerr_vector / 0.85;
% Total power consumption
P_battery_total = P_battery_f + P_battery_r;

figure;
plot(t, P_battery_total, 'LineWidth', 2);
title('Power Consumption at Battery (Total) vs Time');
xlabel('Time (s)');
ylabel('Power (W)');
grid on;

% plotting the individual contributions from front and rear motors
figure;
hold on;
plot(t, P_battery_f, 'r', 'LineWidth', 2);
plot(t, P_battery_r, 'b', 'LineWidth', 2);
hold off;
title('Power Consumption at Battery (Front and Rear Motors) vs Time');
xlabel('Time (s)');
ylabel('Power (W)');
legend('Front Motor', 'Rear Motor');
grid on;