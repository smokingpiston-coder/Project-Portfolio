%**********************************************************************
% IM_main_code.m 
% This program simulates an start of an Induction Machine
%**********************************************************************
%
%  General intiating codes
clear                 %clears all the variables
clc                   %cleans the comand window
close all             %closes all the figures

% Parameter definition of the IM
%**********************************************************************
Rs=1.33;             % Stator resistance
Rr=1.327;             % Rotor resistance
Lm=0.132;             % Magnetizing inductance
Lsl=0.00806;             % Stator leakage inductance
Lrl=0.00806;             % Rotor leakage inductance
J=0.05;                % Inertia of IM+LM, to match the measurements
np=2;                   % pole-pair number
Rfe = 457.142;

% Runs the Pre Calculations file
%**********************************************************************
Pre_Calculations

% Setting up the inductances for the machine model
%**********************************************************************
%defining stator and rotor inductance
Ls=Lsl+Lm;
Lr=Lrl+Lm;

% Defining the inductance matrix LMAT for the induction machine model
LMAT=[Ls,0,Lm,0;
	0,Ls,0,Lm;
	Lm,0,Lr,0;
	0,Lm,0,Lr];

invL_matrix = inv(LMAT); % Calculating the inverse of the LMAT

% Setting the parameters of the simulation
%**********************************************************************
% For the voltage generation
ustep_time1 = Us_step_time; % Us_step_time is calculated in Pre_Calculations
ustep1 = Uspeak; % Uspeak is calculated in Pre_Calculations
theta0 = Us_theta0;

% Initial conditions
%**********************************************************************
ws = wslab;   % Grid frequency, calculated in Pre_Calculations

% initial conditions for the states, initial conditions for the integrators
is_alpha_0 = 0;
is_beta_0  = 0;
ir_alpha_0 = 0;
ir_beta_0  = 0;
wr_0       = 0;
thetar_0   = 0;

% Call solver using panel settings, i.e Variable-step
%**********************************************************************
Tstart=0;       % Starting time for the simulation [s]
Tstop=2;      % End time for the simulation [s]
sim('induction_machine_Simulink',[Tstart,Tstop])

%  post processing part
%**********************************************************************
Post_Pross

