% November/ december 2024
%Group 15
% Porsche Panamera 970 2010 RWD
clear
close all
clc

%----------------series hybrid---------------------------%
disp('Series hybrid')
simout = sim('porsche_panamera_970_series_hybrid.slx');
%parameters
mode = 1; %otto engine gasoline
power_ice = 300; %kw
T_CE = simout.T_CE;
w_CE = simout.w_CE;
%fuel = simout.V_liter

power_em = 300; % [kw]
T_EM = simout.T_EM;
w_EM = simout.w_EM;
%u_bt = simout.U_BT;

power_eg = 300; % [kw]
T_EG = simout.T_EG;
w_EG = simout.w_EG;

% Plotting
plotICE(power_ice,mode,T_CE,w_CE,100)
title('ICE series')

plotEM(power_em,T_EM,w_EM)
title('Electric motor series')

plotEG(power_eg,T_EG,w_EG)
title('Generator series hybrid')

