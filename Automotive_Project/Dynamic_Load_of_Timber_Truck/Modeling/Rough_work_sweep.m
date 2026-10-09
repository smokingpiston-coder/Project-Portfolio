% clear all
% close all 
clc
%% Variable and Parameter Definition
syms y Y w y1 y2 y3 y4 y_dot Y_dot w_dot y1_dot y2_dot y3_dot y4_dot y_ddot Y_ddot w_ddot y1_ddot y2_ddot y3_ddot y4_ddot 
syms phi1 phi1_dot phi1_ddot phi2 phi2_dot phi2_ddot phi3 phi3_dot phi3_ddot z1 z2 z3 z4 z1_dot z2_dot z3_dot z4_dot

% Truck Parameters
Csf = 25000;   % Spring Stiffness of Truck (Front)
Dsf = 3750;    % Damping Coefficient of Truck (Front)
Csr = 90000;   % Spring Stiffness of Truck (Rear)
Dsr = 13500;   % Damping Coefficient of Truck (Rear)

% Trailer Parameters
Csft = 50000;  % Spring Stiffness of Trailer (Front)
Dsft = 5500;   % Damping Coefficient of Trailer (Front)
Csrt = 90000;  % Spring Stiffness of Trailer (Rear)
Dsrt = 8250;   % Damping Coefficient of Trailer (Rear)

% Tire Parameters
Cwr  = 3*161800;   % Radial Stiffness of Truck tire (Rear)
Dwr  = 0;          % Damping Coefficient of Truck tire (Rear)
Cwtr = 3*161800;   % Radial Stiffness of Trailer tire (Rear)
Dwtr = 0;          % Damping Coefficient of Trailer tire (Rear)
Cwf  = 161800;     % Radial Stiffness of Truck tire (Front)
Dwf  = 0;          % Damping Coefficient of Truck tire (Front)
Cwtf = 2*161800;   % Radial Stiffness of Trailer tire (Front)
Dwtf = 0;          % Damping Coefficient of Trailer tire (Front)

% Dimensions
lf  = 4.528;  % Distance from COG to Front axle (Truck)
lr  = 0.942;  % Distance from COG to Rear axle (Truck)
lft = 3.965;  % Distance from COG to Front axle (Trailer)
lrt = 2.985;  % Distance from COG to Rear axle (Trailer)
a1  = 3.867;  % Distance from Truck's COG to Drawbar's articulation point
a2  = 5.565;  % Distance from Trailer's COG to Drawbar's articulation point

% Masses (full-load nominal, will be overwritten in sweep)
m_c   = 30000/2;  % Truck = Kerb Weight (12000) + Load (20000)
m_uf  = 500/2;    % Unsprung mass at Front (Truck) 
m_ur  = 1500/2;   % Unsprung mass at Rear (Truck)
m_ct  = 40000/2;  % Trailer = Kerb Weight (11000) + Load (31000)
m_uft = 1000/2;   % Unsprung mass at Front (Trailer)
m_urt = 1000/2;   % Unsprung mass at Rear (Trailer)

% Drawbar Parameters
m_d  = 250/2;   % Mass of the Drawbar
lfd  = 1.1025;  % Distance from COG of drawbar to the front Articulation point
lrd  = 0.8525;  % Distance from COG of drawbar to the rear Articulation point
Csd  = 15000000;% Spring Stiffness of the Drawbar
Dsd  = 2000;    % Damping Coefficient of the Drawbar

alpha = 1;
Beta  = 1;

% Inertias (for initial full-load case; will be recomputed in sweep)
Iy  = m_c*(lf^2 + lr^2)/2;     % Truck
Iyt = m_ct*(lft^2 + lrt^2)/2;  % Trailer
Iyd = m_d*(lfd^2 + lrd^2)/2;   % Drawbar

%% ------------------------------------------------------------------------
%% Load / velocity sweep and plots
%% ------------------------------------------------------------------------

% Mass decomposition from your comments
kerbTruck   = 12000;  loadTruck   = 20000;
kerbTrailer = 11000;  loadTrailer = 31000;

% Load cases & labels
loadFactors = [1.0, 0.5, 0.0];
loadNames   = {'FullLoad','HalfLoad','NoLoad'};

% Velocities [m/s]
Vx_list = [5 10 15 20 25 30];

% Folder for all figures
figRoot = 'Figures';
if ~exist(figRoot,'dir'); mkdir(figRoot); end

for iLoad = 1:numel(loadFactors)
    fLoad   = loadFactors(iLoad);
    loadStr = loadNames{iLoad};

    % Update sprung masses
    m_c  = (kerbTruck   + fLoad*loadTruck)   / 2;
    m_ct = (kerbTrailer + fLoad*loadTrailer) / 2;

    % Recompute inertias
    Iy  = m_c *(lf^2  + lr^2 )/2;
    Iyt = m_ct*(lft^2 + lrt^2)/2;
    Iyd = m_d *(lfd^2 + lrd^2)/2;

    fprintf('\n=== Load case: %s (factor %.2f), m_c=%.1f, m_ct=%.1f ===\n', ...
        loadStr, fLoad, m_c, m_ct);

    for iV = 1:numel(Vx_list)
        Vx = Vx_list(iV);

        %% Rebuild A,B,C,D for this mass/inertia
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

        %% Road parameters for this Vx
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

        fprintf('  -> Simulating Vx = %2d m/s\n', Vx);

        %% Run Simulink model (writes "out" to base workspace)

        sim('Truck_model_step');  % Truck_model_bump or Truck_model_step

        % Now "out" exists exactly like in your original script.

        %% Compute forces & deflections and save figures for this case
        modelTag = 'step';         % step or 'bump'
        
        %% Compute forces & deflections and save figures for this case
        caseTag    = sprintf('%s_V%02d_%s', loadStr, Vx, modelTag);
        caseFolder = fullfile(figRoot, caseTag);
        if ~exist(caseFolder,'dir'); mkdir(caseFolder); end

        % Tractor tire forces
        Ftractor_Rear  = Cwr  * (out.y2.Data - out.z2.Data);
        Ftractor_Front = Cwf  * (out.y1.Data - out.z1.Data);

        f1 = figure('Visible','off');
        plot(out.tout,Ftractor_Front,'r-'); hold on;
        plot(out.tout,Ftractor_Rear ,'b--');
        title(sprintf('Tractor Tire Forces (%s)', caseTag), 'Interpreter','none');
        xlabel('Time [s]'); ylabel('Force [N]');
        legend('Front','Rear','Location','best');
        grid on;
        exportgraphics(f1, fullfile(caseFolder,'TractorForces.png'));
        close(f1);

        % Trailer tire forces
        Ftrailer_Rear  = Cwtr * (out.y4.Data - out.z4.Data);
        Ftrailer_Front = Cwtf * (out.y3.Data - out.z3.Data);

        f2 = figure('Visible','off');
        plot(out.tout,Ftrailer_Front,'r-'); hold on;
        plot(out.tout,Ftrailer_Rear ,'b--');
        title(sprintf('Trailer Tire Forces (%s)', caseTag), 'Interpreter','none');
        xlabel('Time [s]'); ylabel('Force [N]');
        legend('Front','Rear','Location','best');
        grid on;
        exportgraphics(f2, fullfile(caseFolder,'TrailerForces.png'));
        close(f2);

        % Truck deflection
        f3 = figure('Visible','off');
        plot(out.tout,out.y.Data,'r-','LineWidth',1.2);
        title(sprintf('Truck Sprung Mass Deflection (%s)', caseTag), 'Interpreter','none');
        xlabel('Time [s]'); ylabel('Deflection [m]');
        grid on;
        exportgraphics(f3, fullfile(caseFolder,'TruckDeflection.png'));
        close(f3);

        % Trailer deflection
        f4 = figure('Visible','off');
        plot(out.tout,out.Y.Data,'b-','LineWidth',1.2);
        title(sprintf('Trailer Sprung Mass Deflection (%s)', caseTag), 'Interpreter','none');
        xlabel('Time [s]'); ylabel('Deflection [m]');
        grid on;
        exportgraphics(f4, fullfile(caseFolder,'TrailerDeflection.png'));
        close(f4);

        % Drawbar deflection
        f5 = figure('Visible','off');
        plot(out.tout,out.W.Data,'k-','LineWidth',1.2);
        title(sprintf('Drawbar Deflection (%s)', caseTag), 'Interpreter','none');
        xlabel('Time [s]'); ylabel('Deflection [m]');
        grid on;
        exportgraphics(f5, fullfile(caseFolder,'DrawbarDeflection.png'));
        close(f5);

    end
end

fprintf('\nSweep complete.\n');
