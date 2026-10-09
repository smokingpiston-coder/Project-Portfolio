function [vDot,omegaDotf,omegaDotr,Fzf,Fzr] = Sub_vehicle_dynamics(v,Tdrivf,Tdrivr,slipf,slipr,slope,road_cond,CONST)

% Read parameters
c_d=CONST.c_d;
c_lfCoG=CONST.c_lfCoG;
c_lrCoG=CONST.c_lrCoG;
A_f=CONST.A_f;
air=CONST.air;
theta = slope;
T_f = Tdrivf;
T_r = Tdrivr;

M=CONST.M;
J_w=CONST.J_w; %[kg*m^2] Moment of inertia for two wheels and axle 
g=CONST.g;

h=CONST.h;
L=CONST.L;
l_f=CONST.Lf;
l_r=CONST.Lr;

R_f = CONST.R;
R_r = CONST.R;
RRC = CONST.f_r; % rolling resistance coefficient

% Calculate air resistance & lift
Rair = 0.5*c_d*A_f*air*v^2;
F_air_fz = 0.5*c_lfCoG*A_f*air*v^2;
F_air_rz = 0.5*c_lrCoG*A_f*air*v^2;

% Magic Tire Formula
S_fx = Sub_magic_tireformula(slipf,road_cond);
S_rx = Sub_magic_tireformula(slipr,road_cond);

%----Write your solution below---------------------------------------------
Fzf = -(F_air_fz*L - F_air_fz*S_rx*h - F_air_rz*S_rx*h - L*M*g*cos(theta) + M*g*l_f*cos(theta) + M*S_rx*g*h*cos(theta))/(L + S_fx*h - S_rx*h);

Fzr = -(F_air_rz*L + F_air_fz*S_fx*h + F_air_rz*S_fx*h - M*g*l_f*cos(theta) - M*S_fx*g*h*cos(theta))/(L + S_fx*h - S_rx*h);

vDot = -(L*Rair + F_air_fz*L*S_fx + F_air_rz*L*S_rx + Rair*S_fx*h - Rair*S_rx*h + L*M*g*sin(theta) - L*M*S_fx*g*cos(theta) + M*S_fx*g*l_f*cos(theta) ...
        - M*S_rx*g*l_f*cos(theta) + M*S_fx*g*h*sin(theta) - M*S_rx*g*h*sin(theta))/(M*(L + S_fx*h - S_rx*h));

omegaDotf = (L*T_f + S_fx*T_f*h - S_rx*T_f*h + F_air_fz*L*RRC*R_f + F_air_fz*L*R_f*S_fx - F_air_fz*RRC*R_f*S_rx*h - F_air_rz*RRC*R_f*S_rx*h ...
            - F_air_fz*R_f*S_fx*S_rx*h - F_air_rz*R_f*S_fx*S_rx*h - L*M*RRC*R_f*g*cos(theta) - L*M*R_f*S_fx*g*cos(theta) + M*RRC*R_f*g*l_f*cos(theta) ...
            + M*R_f*S_fx*g*l_f*cos(theta) + M*RRC*R_f*S_rx*g*h*cos(theta) + M*R_f*S_fx*S_rx*g*h*cos(theta))/(J_w*(L + S_fx*h - S_rx*h));

omegaDotr = (L*T_r + S_fx*T_r*h - S_rx*T_r*h + F_air_rz*L*RRC*R_r + F_air_rz*L*R_r*S_rx + F_air_fz*RRC*R_r*S_fx*h + F_air_rz*RRC*R_r*S_fx*h ...
            + F_air_fz*R_r*S_fx*S_rx*h + F_air_rz*R_r*S_fx*S_rx*h - M*RRC*R_r*g*l_f*cos(theta) - M*R_r*S_rx*g*l_f*cos(theta) - M*RRC*R_r*S_fx*g*h*cos(theta) ...
            - M*R_r*S_fx*S_rx*g*h*cos(theta))/(J_w*(L + S_fx*h - S_rx*h));
%--------------------------------------------------------------------------
end