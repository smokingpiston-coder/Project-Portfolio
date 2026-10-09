clc
% Truck Parameters
Csf = 200000;   % Spring Stiffness of Truck (Front)
Dsf = 12000;    % Damping Coefficient of Truck (Front)
Csr = 3*200000;   % Spring Stiffness of Truck (Rear)
Dsr = 3*12000;   % Damping Coefficient of Truck (Rear)

% Trailer Parameters
Csft = 2*250000;  % Spring Stiffness of Trailer (Front)
Dsft = 2*13000;   % Damping Coefficient of Trailer (Front)
Csrt = 3*250000;  % Spring Stiffness of Trailer (Rear)
Dsrt = 3*13000;   % Damping Coefficient of Trailer (Rear)

% Tire Parameters
Cwr  = 3*850000;   % Radial Stiffness of Truck tire (Rear)
Dwr  = 0;          % Damping Coefficient of Truck tire (Rear)
Cwtr = 3*850000;   % Radial Stiffness of Trailer tire (Rear)
Dwtr = 0;          % Damping Coefficient of Trailer tire (Rear)
Cwf  = 850000;     % Radial Stiffness of Truck tire (Front)
Dwf  = 0;          % Damping Coefficient of Truck tire (Front)
Cwtf = 2*850000;   % Radial Stiffness of Trailer tire (Front)
Dwtf = 0;          % Damping Coefficient of Trailer tire (Front)

% Dimensions
lf  = 4.528;  % Distance from COG to Front axle (Truck)
lr  = 0.942;  % Distance from COG to Rear axle (Truck)
lft = 3.965;  % Distance from COG to Front axle (Trailer)
lrt = 2.985;  % Distance from COG to Rear axle (Trailer)
a1  = 3.867;  % Distance from Truck's COG to Drawbar's articulation point
a2  = 5.565;  % Distance from Trailer's COG to Drawbar's articulation point

% Masses (full-load nominal, will be overwritten in sweep)
m_c   = 22000/2; %30000/2;  % Truck = Kerb Weight (12000) + Load (20000)
m_uf  = 500/2;    % Unsprung mass at Front (Truck) 
m_ur  = 1500/2;   % Unsprung mass at Rear (Truck)
m_ct  = (15500+11000)/2; %40000/2;  % Trailer = Kerb Weight (11000) + Load (31000)
m_uft = 1000/2;   % Unsprung mass at Front (Trailer)
m_urt = 1000/2;   % Unsprung mass at Rear (Trailer)

% Drawbar Parameters
m_d  = 250/2;   % Mass of the Drawbar
lfd  = 1.1025;  % Distance from COG of drawbar to the front Articulation point
lrd  = 0.8525;  % Distance from COG of drawbar to the rear Articulation point
Csd  = 6000000;% Spring Stiffness of the Drawbar
Dsd  = 50000;    % Damping Coefficient of the Drawbar

alpha = 1;
Beta  = 1;
g = 9.81;

% Inertias (for initial full-load case; will be recomputed in sweep)
Iy  = m_c*(lf^2 + lr^2)/2;     % Truck
Iyt = m_ct*(lft^2 + lrt^2)/2;  % Trailer
Iyd = m_d*(lfd^2 + lrd^2)/2;   % Drawbar

%% Matrices

M = [m_c 0 0 0 0 0 0 0 0 0 ;
    0 m_uf 0 0 0 0 0 0 0 0 ;
    0 0 m_ur 0 0 0 0 0 0 0 ;
    0 0 0 Iy 0 0 0 0 0 0 ;
    0 0 0 0 m_ct 0 0 0 0 0 ;
    0 0 0 0 0 m_uft 0 0 0 0 ;
    0 0 0 0 0 0 m_urt 0 0 0;
    0 0 0 0 0 0 0 Iyt 0 0 ;
    0 0 0 0 0 0 0 0 m_d 0 ;
    0 0 0 0 0 0 0 0 0 Iyd];

C = [-(Csf+Csr+Csd) Csf Csr (-Csr*lr+Csf*lf-Csd*a1) 0 0 0 0 Csd -Csd*lfd;
    Csf -(Csf+Cwf) 0 -Csf*lf 0 0 0 0 0 0;
    Csr 0 -(Csr+Cwr) Csr*lr 0 0 0 0 0 0;
    (-Csr*lr+Csf*lf-Csd*a1) -Csf*lf Csr*lr -(Csr*lr^2+Csf*lf^2+Csd*a1^2) 0 0 0 0 Csd*a1 -Csd*lfd*a1;
    0 0 0 0 -(Csft+Csrt+Csd) Csft Csrt (-Csrt*lrt+Csft*lft+Csd*a2) Csd Csd*lrd ;
    0 0 0 0 Csft -(Csft+Cwtf) 0 -Csft*lft 0 0;
    0 0 0 0 Csrt 0 -(Csrt+Cwtr) Csrt*lrt 0 0;
    0 0 0 0 (-Csrt*lrt+Csft*lft+Csd*a2) -Csft*lft Csrt*lrt -(Csrt*lrt^2+Csft*lft^2+Csd*a2^2) -Csd*a2 -Csd*lrd*a2;
    Csd 0 0 (Csd*a1) Csd 0 0 (-Csd*a2) -(Csd+Csd) (Csd*lfd-Csd*lrd);
    -Csd*lfd 0 0 (-Csd*lfd*a1) Csd*lrd 0 0 (-Csd*lrd*a2) (-Csd*lrd+Csd*lfd) -(Csd*lfd^2+Csd*lrd^2) ];

K = [-(Dsf+Dsr+Dsd) Dsf Dsr (-Dsr*lr+Dsf*lf-Dsd*a1) 0 0 0 0 Dsd -Dsd*lfd;
    Dsf -Dsf 0 -Dsf*lf 0 0 0 0 0 0;
    Dsr 0 -Dsr Dsr*lr 0 0 0 0 0 0;
    (-Dsr*lr+Dsf*lf-Dsd*a1) -Dsf*lf Dsr*lr -(Dsr*lr^2+Dsf*lf^2+Dsd*a1^2) 0 0 0 0 Dsd*a1 -Dsd*lfd*a1;
    0 0 0 0 -(Dsft+Dsrt+Dsd) Dsft Dsrt (-Dsrt*lrt+Dsft*lft+Dsd*a2) Dsd Dsd*lrd;
    0 0 0 0 Dsft -Dsft 0 -Dsft*lft 0 0;
    0 0 0 0 Dsrt 0 -Dsrt Dsrt*lrt 0 0;
    0 0 0 0 (-Dsrt*lrt+Dsft*lft+Dsd*a2) -Dsft*lft Dsrt*lrt -(Dsrt*lrt^2+Dsft*lft^2+Dsd*a2^2) -Dsd*a2 -Dsd*lrd*a2;
    Dsd 0 0 (Dsd*a1) Dsd 0 0 (-Dsd*a2) -(Dsd+Dsd) (Dsd*lfd-Dsd*lrd);
    -Dsd*lfd 0 0 (-Dsd*lfd*a1) Dsd*lrd 0 0 (-Dsd*lrd*a2) (-Dsd*lrd+Dsd*lfd) -(Dsd*lfd^2+Dsd*lrd^2)];

F = [m_c*g; m_uf*g; m_ur*g; 0; m_ct*g; m_uft*g; m_urt*g; 0; m_d*g; 0];

q0 = C\F;

x0 = [q0; zeros(size(q0))];

A = [zeros(10) eye(10);
    M\C M\K];

B = [0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    Cwf/m_uf 0 0 0;
    0 Cwr/m_ur 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 Cwtf/m_uft 0;
    0 0 0 Cwtr/m_urt;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0];


C_ss = eye(20);

D = zeros(20,4);

U0 = zeros(size(x0));

%% Road parameters for this Vx
Vx = 20; % Example vehicle speed in m/s
        lambda = 10;
        omega  = 2*pi*Vx/lambda; %#ok<NASGU>
        s1 = 1.365;
        s2 = 5.47  + 1.365;
        s3 = 11.95 + 1.365;
        s4 = 18.9  + 1.365;
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
