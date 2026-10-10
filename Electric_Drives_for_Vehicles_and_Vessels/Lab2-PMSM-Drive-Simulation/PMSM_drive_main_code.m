%**********************************************************************
%  PMSM_drive_main_code.m 
%
%   Template for lab 2, EEN140
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

% Parameter definition (4 kW 4-pole PMSM)
%**********************************************************************

Rs=1.33;               % Stator resistance     
Laa0 = 40e-3;
Lab0 = 20e-3;
Laa2 = -17e-3;
Lsd = Laa0+Lab0+3/2*Laa2 % d-stator inductance
Lsq = Laa0+Lab0-3/2*Laa2 % q-stator inductance
Psim = 0.822;           % Flux linkage from the magnets
J=0.0125;              % Inertia of PMSM
fs=50;                 % grid frequency
ws=2*pi*fs;
np=2;                   % pole-pair number
Tn=4000/(1500*pi/30);  % Rated shaft torque
B=0.08;                % slope of the speed dependent load torque 

% Current controller
%**********************************************************************
Beta_fixed = 113.1793;
alfac = 1000;

Lsdhat = Lsd;
Lsqhat = Lsq;
Rad  = alfac*Lsdhat-Rs;
Raq  = alfac*Lsqhat-Rs;
Kpcd = alfac*Lsdhat;
Kicd = alfac*(Rs+Rad);
Kpcq = alfac*Lsqhat;
Kicq = alfac*(Rs+Raq);
Umax = 440*sqrt(2/3);     % Voltage limiter
VconvLim = Umax;
Irated = 6.5*sqrt(2);

% Speed controller
%**************************************************************************
alfaw = 20;
Ba =  alfaw*J - B;
Kpw = alfaw*J;
Kiw = alfaw*(B+Ba);




% Parameters for the grid connected, open loop, PMSM, for the simulation
% for the Lab 4 in the course EEN135
%**********************************************************************
% Calculating the initial values
Te0 = B*ws/np;
Imag0 = -Psim/(2*(Lsd-Lsq)*cosd(Beta_fixed))+sqrt((Psim/(2*(Lsd-Lsq)*cosd(Beta_fixed)))^2+2*Te0/(3*np*(Lsd-Lsq)*cosd(Beta_fixed)*sind(Beta_fixed)))
isd0 = cosd(Beta_fixed)*Imag0;      % Initial value for the isd integrator
isq0 = sind(Beta_fixed)*Imag0;      % Initial value for the isq integrator
wr0 = ws;                           % Initial value for the wr integrator (electrical speed)
theta0 = 0;                         % Initial value for the thetar integrator (electrical position)
usd0 = Rs*isd0-ws*Lsq*isq0;
usq0 = Rs*isq0+ws*Lsd*isd0+ws*Psim;

% Parameters for the simulation
%**********************************************************************
Te_ref_time = 0.1;
Te_ref = 16.6;
Te_ref_time2 = 2.7;
Te_ref2 = 4;
% 
Beta_time = 2.3;
Beta0 = Beta_fixed*pi/180;
Beta_step = 130*pi/180;

TL_extra_time=1.1;
TL_extra=4;


wr_ref_time = 0.1;
wr_ref = 1500*pi/30*np;

% Call solver using panel settings, i.e Variable-step
%**********************************************************************
% Initial conditions = 0
isd0 = 0;
isq0 = 0;
wr0  = 0;
theta0 = 0;


Tstart=0;
Tstop=4;
sim('PMSM_drive_Simulink',[Tstart,Tstop])

%**********************************************************************
%  postprocessning part
%**********************************************************************
Post_ProcessPMSM_drive

