%**********************************************************************
%  PMSM_main_code.m 
%
%   Template for lab 4, EEN135
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

% Parameters for the grid connected, open loop, PMSM
%**********************************************************************
% Calculating the initial values
Beta_fixed = 113.1793;
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
TL_extra_time=0.5;  % The time when the step is done
%TL_extra=12;        % The load torque that is added, for question 2b) and c)
TL_extra=32;      % The load torque that is added, for question 2d)

% Call solver using panel settings, i.e Variable-step
%**********************************************************************
Tstart=0;
Tstop=2.5;
sim('PMSM_Simulink',[Tstart,Tstop])

%**********************************************************************
%  postprocessning part
%**********************************************************************
PostProssPMSM

