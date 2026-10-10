% November/ december 2024
%Group 15
% Porsche Panamera 970 2010 RWD
clear
close all
clc

%----------------Paralell hybrid---------------------------%
disp('Paralell hybrid')
simout_paralell = sim('ParallelHybrid');
%parameters
mode = 1; %otto engine gasoline
power_ice_p = 285; %kw
T_CE_p = simout_paralell.T_CE;
w_CE_p = simout_paralell.w_CE;
%fuel = simout.V_liter

power_em_p = 16; % [kw]
T_EM_p = simout_paralell.T_EM;
w_EM_p = simout_paralell.w_EM;
%u_bt = simout.U_BT;

% Plotting

plotICE(power_ice_p,mode,T_CE_p,w_CE_p,100)
title('ICE paralell')
plotEM(power_em_p,T_EM_p,w_EM_p)
title('Electric motor paralell')

