
% clear all
% close all 
clc
%% Variable and Parameter Definition
syms y Y w y1 y2 y3 y4 y_dot Y_dot w_dot y1_dot y2_dot y3_dot y4_dot y_ddot Y_ddot w_ddot y1_ddot y2_ddot y3_ddot y4_ddot 
syms phi1 phi1_dot phi1_ddot phi2 phi2_dot phi2_ddot phi3 phi3_dot phi3_ddot z1 z2 z3 z4 z1_dot z2_dot z3_dot z4_dot

% % Truck Parameters
% Csf = 295000;
% Dsf = 2900;
% Csr = 797000;
% Dsr = 5900;
% % Trailer Parameters
% Csft = 295000;
% Dsft = 2900;
% Csrt = 797000;
% Dsrt = 5900;

% Truck Parameters
Csf = 25000;   % Spring Stiffness of Truck (Front)
Dsf = 3750;    % Damping Coefficient of Truck (Front)
Csr = 90000;   % Spring Stiffness of Truck (Rear)
Dsr = 13500;   % Damping Coefficient of Truck (Rear)


% Trailer Parameters
Csft = 50000;  %2440000; % Spring Stiffness of Trailer (Front)
Dsft = 5500;             % Damping Coefficient of Trailer (Front)
Csrt = 90000;  %3660000; % Spring Stiffness of Trailer (Rear)
Dsrt = 8250;             % Damping Coefficient of Trailer (Rear)

% Tire Parameters
Cwr = 3*161800;   % Radial Stiffness of Truck tire (Rear)
Dwr = 0;          % Damping Coefficient of Truck tire (Rear)
Cwtr = 3*161800;  % Radial Stiffness of Trailer tire (Rear)
Dwtr = 0;         % Damping Coefficient of Trailer tire (Rear)
Cwf = 161800;     % Radial Stiffness of Truck tire (Front)
Dwf = 0;          % Damping Coefficient of Truck tire (Front)
Cwtf = 2*161800;  % Radial Stiffness of Trailer tire (Front)
Dwtf = 0;         % Damping Coefficient of Trailer tire (Front)

% Dimensions
lf = 4.528;  % Distance from COG to Front axle (Truck)
lr = 0.942;  % Distance from COG to Rear axle (Truck)
lft = 3.965; % Distance from COG to Front axle (Trailer)
lrt = 2.985; % Distance from COG to Rear axle (Trailer)
a1 = 3.867;  % Distance from Truck's COG to Drawbar's articulation point
a2 = 5.565;  % Distance from Trailer's COG to Drawbar's articulation point

% Masses
m_c = 30000/2;  % Mass of the Truck = Kerb Weight (12000) + Load (20000)
% Unsprung masses were approximated from the kerb weight
m_uf = 500/2;   % Unsprung mass at Front (Truck) 
m_ur = 1500/2;  % Unsprung mass at Rear (Truck)

m_ct = 40000/2;  % Mass of the Trailer = Kerb Weight (11000) + Load (31000)
% Unsprung masses were approximated from the kerb weight
m_uft = 1000/2;  % Unsprung mass at Front (Trailer)
m_urt = 1000/2;  % Unsprung mass at Rear (Trailer)

% Drawbar Parameters
m_d = 250/2;  % Mass of the Drawbar
lfd = 1.1025; % Distance from COG of drawbar to the front Articulation point
lrd = 0.8525; % Distance from COG of drawbar to the rear Articulation point
Csd = 15000000; % Spring Stiffness of the Drawbar
Dsd = 2000;     % Damping Coefficient of the Drawbar

alpha = 1;
Beta = 1;

% Moment of intertia aroud Yaw Axis (Y-Axis)

Iy = m_c*(lf^2+lr^2)/2;     % Truck
Iyt = m_ct*(lft^2+lrt^2)/2; % Trailer
Iyd = m_d*(lfd^2+lrd^2)/2;  % Drawbar

%% State-Space Model

% A = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%     -(Csf+Csr)/m_c -(Dsf+Dsr)/m_c Csf/m_c Dsf/m_c Csr/m_c Dsr/m_c (Csr*lr-Csf*lf)/m_c (Dsr*lr-Dsf*lf)/m_c Csft/m_c 0 -Csft/m_c 0 0 0 (Csft*lft)/m_c 0 0 0 0 0;
%     0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%     Csf/m_uf Dsf/m_uf -(Csf+Cwf)/m_uf -Dsf/m_uf 0 0 Csf*lf/m_uf Dsf*lf/m_uf 0 0 0 0 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%     Csr/m_ur Dsr/m_ur 0 0 -(Csr+Cwr)/m_ur -Dsr/m_ur -Csr*lr/m_ur -Dsr*lr/m_ur 0 0 0 0 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
%     (Csr*lr-Csf*lf)/Iy (Dsr*lr-Dsf*lf)/Iy Csf*lf/Iy Dsf*lf/Iy -Csr*lr/Iy -Dsr*lr/Iy -(Csr*lr^2+Csf*lf^2)/Iy -(Dsr*lr^2+Dsf*lf^2)/Iy -Csft*lr/Iy 0 Csft*lr/Iy 0 0 0 (-Csft*lr*lft)/Iy 0 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
%     Csr/m_ct 0 0 0 -Csr/m_ct 0 (-Csr*lr)/m_ct 0 -(Csft+Csrt)/m_ct -(Dsft+Dsrt)/m_ct Csft/m_ct Dsft/m_ct Csrt/m_ct Dsrt/m_ct (Csrt*lrt-Csft*lft)/m_ct (Dsrt*lrt-Dsft*lft)/m_ct 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 0 Csft/m_uft Dsft/m_uft -(Csft+Cwtf)/m_uft -Dsft/m_uft 0 0 Csft*lft/m_uft Dsft*lft/m_uft 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 ;
%     0 0 0 0 0 0 0 0 Csrt/m_urt Dsrt/m_urt 0 0 -(Csrt+Cwtr)/m_urt -Dsrt/m_urt -Csrt*lrt/m_urt -Dsrt*lrt/m_urt 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
%     Csr*lft/Iyt 0 0 0 -Csr*lft/Iyt 0 (-Csr*lr*lft)/Iyt 0 (Csrt*lrt-Csft*lft)/Iyt (Dsrt*lrt-Dsft*lft)/Iyt Csft*lft/Iyt Dsft*lft/Iyt -Csrt*lrt/Iyt -Dsrt*lrt/Iyt -(Csrt*lrt^2+Csft*lft^2)/Iyt -(Dsrt*lrt^2+Dsft*lft^2)/Iyt 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
%     0 0 0 0 Csr/m_d Dsr/m_d 0 0 0 0 Csft/m_d Dsft/m_d 0 0 0 0 -(Csr+Csft)/m_d -(Dsr+Dsft)/m_d (Csr*lfd-Csft*lrd)/m_d (Dsr*lfd-Dsft*lrd)/m_d;
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
%     0 0 0 0 Csr*lfd/Iyd Dsr*lfd/Iyd 0 0 0 0 -Csft*lrd/Iyd -Dsft*lrd/Iyd 0 0 0 0 (Csft*lrd-Csr*lfd)/Iyd (Dsft*lrd-Dsr*lfd)/Iyd (Csr*lfd^2+Csft*lrd^2)/Iyd (Dsr*lfd^2+Dsft*lrd^2)/Iyd];


% A = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%     -(Csf+Csr+Csd)/m_c -(Dsf+Dsr+Dsd)/m_c Csf/m_c Dsf/m_c (Csr)/m_c Dsr/m_c (-Csr*lr+Csf*lf-Csd*a1)/m_c (-Dsr*lr+Dsf*lf-Dsd*a1)/m_c 0 0 0 0 0 0 0 0 Csd/m_c Dsd/m_c -Csd*lfd/m_c -Dsd*lfd/m_c;
%     0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%     Csf/m_uf Dsf/m_uf -(Csf+Cwf)/m_uf -Dsf/m_uf 0 0 -Csf*lf/m_uf -Dsf*lf/m_uf 0 0 0 0 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
%     Csr/m_ur Dsr/m_ur 0 0 -(Csr+Cwr)/m_ur -Dsr/m_ur Csr*lr/m_ur Dsr*lr/m_ur 0 0 0 0 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
%     (-Csr*lr+Csf*lf+Csd*a1)/Iy (-Dsr*lr+Dsf*lf+Dsd*a1)/Iy -Csf*lf/Iy -Dsf*lf/Iy Csr*lr/Iy Dsr*lr/Iy -(Csr*lr^2+Csf*lf^2-Csd*a1^2)/Iy -(Dsr*lr^2+Dsf*lf^2-Dsd*a1^2)/Iy 0 0 0 0 0 0 0 0 -Csd*a1/Iy -Dsd*a1/Iy Csd*lfd*a1/Iy Dsd*lfd*a1/Iy;
%     0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 0 -(Csft+Csrt+Csd)/m_ct -(Dsft+Dsrt+Dsd)/m_ct Csft/m_ct Dsft/m_ct Csrt/m_ct Dsrt/m_ct (-Csrt*lrt+Csft*lft+Csd*a2)/m_ct (-Dsrt*lrt+Dsft*lft+Dsd*a2)/m_ct Csd/m_ct Dsd/m_ct Csd*lrd/m_ct Dsd*lrd/m_ct;
%     0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 0 Csft/m_uft Dsft/m_uft -(Csft+Cwtf)/m_uft -Dsft/m_uft 0 0 -Csft*lft/m_uft -Dsft*lft/m_uft 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 ;
%     0 0 0 0 0 0 0 0 Csrt/m_urt Dsrt/m_urt 0 0 -(Csrt+Cwtr)/m_urt -Dsrt/m_urt Csrt*lrt/m_urt Dsrt*lrt/m_urt 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
%     0 0 0 0 0 0 0 0 (-Csrt*lrt+Csft*lft-Csd*a2)/Iyt (-Dsrt*lrt+Dsft*lft-Dsd*a2)/Iyt -Csft*lft/Iyt -Dsft*lft/Iyt Csrt*lrt/Iyt Dsrt*lrt/Iyt -(Csrt*lrt^2+Csft*lft^2-Csd*a2^2)/Iyt -(Dsrt*lrt^2+Dsft*lft^2-Dsd*a2^2)/Iyt Csd*a2/Iyt Dsd*a2/Iyt Csd*lrd*a2/Iyt Dsd*lrd*a2/Iyt;
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
%     Csd/m_d Dsd/m_d 0 0 0 0 (Csd*a1)/m_d (Dsd*a1)/m_d Csd/m_d Dsd/m_d 0 0 0 0 (-Csd*a2)/m_d (-Dsd*a2)/m_d -(Csd+Csd)/m_d -(Dsd+Dsd)/m_d (Csd*lfd-Csd*lrd)/m_d (Dsd*lfd-Dsd*lrd)/m_d;
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
%     -Csd*lfd/Iyd -Dsd*lfd/Iyd 0 0 0 0 (-Csd*lfd*a1)/Iyd (-Dsd*lfd*a1)/Iyd Csd*lrd/Iyd Dsd*lrd/Iyd 0 0 0 0 (-Csd*lrd*a2)/Iyd (-Dsd*lrd*a2)/Iyd (-Csd*lrd+Csd*lfd)/Iyd (-Dsd*lrd+Dsd*lfd)/Iyd -(Csd*lfd^2+Csd*lrd^2)/Iyd -(Dsd*lfd^2+Dsd*lrd^2)/Iyd];
% 

A = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    -(Csf+Csr+Csd)/m_c -(Dsf+Dsr+Dsd)/m_c Csf/m_c Dsf/m_c (Csr)/m_c Dsr/m_c (-Csr*lr+Csf*lf-Csd*a1)/m_c (-Dsr*lr+Dsf*lf-Dsd*a1)/m_c 0 0 0 0 0 0 0 0 Csd/m_c Dsd/m_c -Csd*lfd/m_c -Dsd*lfd/m_c;
    0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    Csf/m_uf Dsf/m_uf -(Csf+Cwf)/m_uf -Dsf/m_uf 0 0 -Csf*lf/m_uf -Dsf*lf/m_uf 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    Csr/m_ur Dsr/m_ur 0 0 -(Csr+Cwr)/m_ur -Dsr/m_ur Csr*lr/m_ur Dsr*lr/m_ur 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
    (-Csr*lr+Csf*lf-Csd*a1)/Iy (-Dsr*lr+Dsf*lf-Dsd*a1)/Iy -Csf*lf/Iy -Dsf*lf/Iy Csr*lr/Iy Dsr*lr/Iy -(Csr*lr^2+Csf*lf^2+Csd*a1^2)/Iy -(Dsr*lr^2+Dsf*lf^2+Dsd*a1^2)/Iy 0 0 0 0 0 0 0 0 Csd*a1/Iy Dsd*a1/Iy -Csd*lfd*a1/Iy -Dsd*lfd*a1/Iy;
    0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 -(Csft+Csrt+Csd)/m_ct -(Dsft+Dsrt+Dsd)/m_ct Csft/m_ct Dsft/m_ct Csrt/m_ct Dsrt/m_ct (-Csrt*lrt+Csft*lft+Csd*a2)/m_ct (-Dsrt*lrt+Dsft*lft+Dsd*a2)/m_ct Csd/m_ct Dsd/m_ct Csd*lrd/m_ct Dsd*lrd/m_ct;
    0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 Csft/m_uft Dsft/m_uft -(Csft+Cwtf)/m_uft -Dsft/m_uft 0 0 -Csft*lft/m_uft -Dsft*lft/m_uft 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 Csrt/m_urt Dsrt/m_urt 0 0 -(Csrt+Cwtr)/m_urt -Dsrt/m_urt Csrt*lrt/m_urt Dsrt*lrt/m_urt 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
    0 0 0 0 0 0 0 0 (-Csrt*lrt+Csft*lft+Csd*a2)/Iyt (-Dsrt*lrt+Dsft*lft+Dsd*a2)/Iyt -Csft*lft/Iyt -Dsft*lft/Iyt Csrt*lrt/Iyt Dsrt*lrt/Iyt -(Csrt*lrt^2+Csft*lft^2+Csd*a2^2)/Iyt -(Dsrt*lrt^2+Dsft*lft^2+Dsd*a2^2)/Iyt -Csd*a2/Iyt -Dsd*a2/Iyt -Csd*lrd*a2/Iyt -Dsd*lrd*a2/Iyt;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
    Csd/m_d Dsd/m_d 0 0 0 0 (Csd*a1)/m_d (Dsd*a1)/m_d Csd/m_d Dsd/m_d 0 0 0 0 (-Csd*a2)/m_d (-Dsd*a2)/m_d -(Csd+Csd)/m_d -(Dsd+Dsd)/m_d (Csd*lfd-Csd*lrd)/m_d (Dsd*lfd-Dsd*lrd)/m_d;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
    -Csd*lfd/Iyd -Dsd*lfd/Iyd 0 0 0 0 (-Csd*lfd*a1)/Iyd (-Dsd*lfd*a1)/Iyd Csd*lrd/Iyd Dsd*lrd/Iyd 0 0 0 0 (-Csd*lrd*a2)/Iyd (-Dsd*lrd*a2)/Iyd (-Csd*lrd+Csd*lfd)/Iyd (-Dsd*lrd+Dsd*lfd)/Iyd -(Csd*lfd^2+Csd*lrd^2)/Iyd -(Dsd*lfd^2+Dsd*lrd^2)/Iyd];

B = [0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    Cwf/m_uf 0 0 0;
    0 0 0 0;
    0 Cwr/m_ur 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 Cwtf/m_uft 0;
    0 0 0 0;
    0 0 0 Cwtr/m_urt;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0];

C = eye(20);

D = zeros(20,4);

%% Road Parameters

Vx = 10 ;      % Longitudinal Velocity (m/s)
lambda = 10 ;    % Not used
omega = 2*pi*Vx/lambda;  % Not used
s1 = 1.365;
s2 = 5.47 + 1.365;
s3 = 11.95 + 1.365;
s4 = 18.9 + 1.365;
t1 = s1/Vx;
t2 = s2/Vx;
t3 = s3/Vx;
t4 = s4/Vx;

%% Tire Force Calculation.

% Tractor
Ftractor_Rear = Cwr*(out.y2.Data-out.z2.Data) ; 

Ftractor_Front = Cwf*(out.y1.Data-out.z1.Data) ;

figure(1);
plot(out.tout,Ftractor_Front,'r-');
hold on
plot(out.tout,Ftractor_Rear,'b--');
hold off
title('Tire Contact Forces at Front and Rear Axles of the Tractor')
xlabel('Time [Secs]')
ylabel('Force [N]')
legend('F_t_r_a_c_t_o_r Front' ,'F_t_r_a_c_t_o_r Rear')


% Trailer

Ftrailer_Rear = Cwtr*(out.y4.Data-out.z4.Data) ; 

Ftrailer_Front = Cwtf*(out.y3.Data-out.z3.Data) ;

figure(2);
plot(out.tout,Ftrailer_Front,'r-');
hold on
plot(out.tout,Ftrailer_Rear,'b--');
hold off
title('Tire Contact Forces at Front and Rear Axles of the Trailer')
xlabel('Time [Secs]')
ylabel('Force [N]')
legend('F_t_r_a_i_l_e_r Front' ,'F_t_r_a_i_l_e_r Rear')


%% Deflections

% Truck

figure(3);
plot(out.tout,out.y.Data,'r-',LineWidth=1.2)
title('Sprung mass (Chassis) Deflection of Truck')
xlabel('Time [Secs]')
ylabel('Deflection [m]')
grid on


% Trailer
figure(4);
plot(out.tout,out.Y.Data,'b-',LineWidth=1.2)
title('Sprung mass (Chassis) Deflection of Trailer')
xlabel('Time [Secs]')
ylabel('Deflection [m]')
grid on


% Drawbar
figure(5);
plot(out.tout,out.W.Data,'k-',LineWidth=1.2)
title('Drawbar Deflection')
xlabel('Time [Secs]')
ylabel('Deflection [m]')
grid on


