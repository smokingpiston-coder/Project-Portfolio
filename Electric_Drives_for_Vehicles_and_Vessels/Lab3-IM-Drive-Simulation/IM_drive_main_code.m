%**********************************************************************
%  IM_drive_main_code.m 
%
%   Template for lab 3, EEN140
%**********************************************************************
%
clc         % clear command window
clear all   % clear workspace memory
close all   % closing all plot windows

workspace                                                                       %makes sure that the workspace panel is on
filebrowser                                                                     %makes sure that the folder browser is on
format compact                                                                  %suppress excess blank lines to show more output on a single screen.
set(groot,'defaultFigureCreateFcn',@(fig,~)addToolbarExplorationButtons(fig));  %add zoom buttons to the figure toolbar
set(groot,'defaultAxesCreateFcn',@(ax,~)set(ax.Toolbar,'Visible','off'));       %add zoom buttons to the figure toolbar
set(0,'defaultAxesYGrid','on');
set(0,'defaultAxesXGrid','on');

% Parameter definition (4 kW 4-pole machine)
%**********************************************************************
Rs=1.33;             % Stator resistance
Rr=1.24;             % Rotor resistance      
Lm=0.135;             % Magnetizing inductance
Lsl=0.008;             % Stator leakage inductance
Lrl=0.008;             % Rotor leakage inductance
Ls=Lm+Lsl;             % Stator inductance
Lr=Lm+Lrl;             % Rotor inductance
J=0.0125;           % Inertia of IM
np=2;                   % pole-pair number
Tn=26.6;               % Rated shaft torque
B=0.08;                % Mechanical damping
Israted = 9.1*sqrt(2); % Rated stator current
%Israted = inf; % Unlimited current

% Defining the parameters for the induction machine
%**********************************************************************
% Defining the inductance matrix LMAT for the induction machine model
LMAT=[Ls,0,Lm,0;
	0,Ls,0,Lm;
	Lm,0,Lr,0;
	0,Lm,0,Lr];

invL_matrix = inv(LMAT); % Calculating the inverse of the LMAT

% initial conditions for the states, initial conditions for the integrators
is_alpha_0 = 0;
is_beta_0  = 0;
ir_alpha_0 = 0;
ir_beta_0  = 0;
wr_0       = 0;
thetar_0   = 0;

% Calculating the Invers Gamma model parameters
%**********************************************************************
RR = (Lm/Lr)^2*Rr;
LM = Lm^2/Lr;
Lsigma = Ls-LM;

% Current controller
%**********************************************************************
% Defining the estimated machine parameters
Rshat = Rs*1;
RRhat = RR*1;
Lsigmahat = Lsigma*1;
LMhat = LM*0.9;
Jhat = J*1;
Bhat = B*1;

alfac = 1000;
Ra  = (alfac*Lsigmahat-Rshat-RRhat)*1;
Kpc = alfac*Lsigmahat;
Kic = alfac*(Rshat+RRhat+Ra);
%AntiW = 0;      % Antiwindup is NOT used
AntiW = 1;      % Antiwindup is used

%VconvLim = inf; % Voltage limiter value for the converter
VconvLim = 440*sqrt(2/3); % Voltage limiter value for the converter
Umax = VconvLim;     % Voltage limiter

% Speed contoller
%**********************************************************************
alfaw = 20;
Ba = (alfaw*Jhat-Bhat)*1;
Kpw = alfaw*Jhat;
Kiw = alfaw*(Bhat+Ba);

% Current model flux observer
%**********************************************************************
PsiRhat0 = 0; % Initial rotor flux magnitude for the current model flux observer
thetahat0 = 0; % Initial angle for the current model flux observer

% Inputs
%**********************************************************************
Flux_ref = 0.9; % Rotor flux magnitude reference, inverse gamma model
Flux_ref_time = 0.001;

% Torque reference
Te_reftime1=1;
Te_ref1=12;
Te_reftime2=2;
Te_reftime3=2.1;
Te_ref2=8;

% Speed reference
Wr_ref_step_time = 1.0; % s
Wr_ref_step = 1435*pi/30; % rad/s

% Extra load torque
TL_extra_time=10; % For current controller
%TL_extra_time=1.5; % For speed controller
TL_extra=14.6;

% Call solver
%**********************************************************************
Tstart=0;
Tstop=3;
sim('IM_drive_Simulink',[Tstart,Tstop])

%  postprocessning part
%**********************************************************************
Post_ProcessIM_drive


