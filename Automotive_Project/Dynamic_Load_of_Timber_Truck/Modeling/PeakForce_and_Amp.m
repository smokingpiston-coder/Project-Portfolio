%% Before running the code, put a breakpoint at line 486 and perform the sweep first
% clear all
% close all 
clc
%% Variable and Parameter Definition
syms y Y w y1 y2 y3 y4 y_dot Y_dot w_dot y1_dot y2_dot y3_dot y4_dot y_ddot Y_ddot w_ddot y1_ddot y2_ddot y3_ddot y4_ddot 
syms phi1 phi1_dot phi1_ddot phi2 phi2_dot phi2_ddot phi3 phi3_dot phi3_ddot z1 z2 z3 z4 z1_dot z2_dot z3_dot z4_dot

% Truck Parameters
Csf = 240000/2;   % Spring Stiffness of Truck (Front)
Dsf = 12000/2;    % Damping Coefficient of Truck (Front)
Csr = 3*300000/2;   % Spring Stiffness of Truck (Rear)
Dsr = 3*12000/2;   % Damping Coefficient of Truck (Rear)

% Trailer Parameters
Csft = 2*240000/2;  % Spring Stiffness of Trailer (Front)
Dsft = 2*13000/2;   % Damping Coefficient of Trailer (Front)
Csrt = 3*300000/2;  % Spring Stiffness of Trailer (Rear)
Dsrt = 3*13000/2;   % Damping Coefficient of Trailer (Rear)

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
Csd  = 6000000;% Spring Stiffness of the Drawbar
Dsd  = 50000;    % Damping Coefficient of the Drawbar

alpha = 1;
Beta  = 1;
g = 9.81;

% Inertias (for initial full-load case; will be recomputed in sweep)
Iy  = m_c*(lf^2 + lr^2)/2;     % Truck
Iyt = m_ct*(lft^2 + lrt^2)/2;  % Trailer
Iyd = m_d*(lfd^2 + lrd^2)/2;   % Drawbar

% Disturbance Start time
tref_start = 0.5; % [Secs] Used in Simulink, Change here to reflect in Simulink

% Bridge Length
L = 15; % [m]

%% ------------------------------------------------------------------------
%% Function to compute Settling Time
%% ------------------------------------------------------------------------

% Settling time function

function Ts = settling_time(t, y)

    tol = 0.05;   %   5 % band

    y_final = y(end);                % steady-state approx
    band_hi = y_final * (1 + tol);
    band_lo = y_final * (1 - tol);

    idx = find(y < band_lo | y > band_hi); % indices outside band

    if isempty(idx)
        Ts = 0;  % already settled
    else
        Ts = t(idx(end));  % last time outside band
    end
end

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
Vx_list = [5 10 15 20 25];

% Folder for all figures
figRoot = 'Figures';
if ~exist(figRoot,'dir'); mkdir(figRoot); end

% RESULTS STRUCTURE
Results = struct();

for iLoad = 1:numel(loadFactors)
    fLoad   = loadFactors(iLoad);
    loadStr = loadNames{iLoad};

    % Store per-load-case struct
    Results.(loadStr) = struct();

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

        s1 = 1.365;
        s2 = 5.47  + 1.365;
        s3 = 11.95 + 1.365;
        s4 = 18.9  + 1.365;
        t1 = s1/Vx;
        t2 = s2/Vx;
        t3 = s3/Vx;
        t4 = s4/Vx;

        %% Reference time for each axle group, time instant at which it hits the bump

        tref_1 = tref_start + t1;
        tref_2 = tref_start + t2;
        tref_3 = tref_start + t3;
        tref_4 = tref_start + t4;


        fprintf('  -> Simulating Vx = %2d m/s\n', Vx);

        %% Run Simulink model (writes "out" to base workspace)

        sim('Truck_staticEq_step.slx');  % Truck_model_bump or Truck_model_step

        % Now "out" exists exactly like in your original script.

        %% Compute forces & deflections and save figures for this case
        modelTag = 'step';         % step or 'bump'
        
        %% Compute forces & deflections and save figures for this case
        caseTag    = sprintf('%s_V%02d_%s', loadStr, Vx, modelTag);
        caseFolder = fullfile(figRoot, caseTag);
        if ~exist(caseFolder,'dir'); mkdir(caseFolder); end

        % Tractor tire forces
        Ftractor_Rear  = Cwr  * (ans.y2.Data - ans.z2.Data); %- m_c*lf*g/(lr+lf) - m_ur*g;
        Ftractor_Front = Cwf  * (ans.y1.Data - ans.z1.Data); %- m_c*lr*g/(lr+lf) - m_uf*g;
        Fstat_tractor_Rear =  m_c*lf*g/(lr+lf) + m_ur*g;
        Fstat_tractor_Front =  m_c*lr*g/(lr+lf) + m_uf*g;
        % Peak Force value
        FPeak_tractor_Rear = max(abs(Ftractor_Rear));
        FPeak_tractor_Front = max(abs(Ftractor_Front));
        % Force Amplification
        AF_tractor_Rear = FPeak_tractor_Rear/Fstat_tractor_Rear;
        AF_tractor_Front = FPeak_tractor_Front/Fstat_tractor_Front;
        % Settling Time
        t = ans.tout;
        Ts_Tractor_Front  = settling_time(t, -Ftractor_Front) ;
        Ts_Tractor_Rear   = settling_time(t, -Ftractor_Rear)  ;
        % Force in Spatial Domain
        F1 = Ftractor_Front ;
        F2 = Ftractor_Rear ;
        x1 = Vx*(t-tref_1);
        x2 = Vx*(t-tref_2);
        
        % Extracting forces only along the bridge

        I1 = find(x1 >= 0 & x1 <= L);
        F1_bridge = F1(I1);
        x1_bridge = x1(I1);
        

        I2 = find(x2 >= 0 & x2 <= L);
        F2_bridge = F2(I2);
        x2_bridge = x2(I2);
        



        f1 = figure('Visible','off');
        plot(ans.tout,Ftractor_Front,'r-'); hold on;
        plot(ans.tout,Ftractor_Rear ,'b--');
        title(sprintf('Tractor Tire Forces (%s)', caseTag), 'Interpreter','none');
        xlabel('Time [s]'); ylabel('Force [N]');
        legend('Front','Rear','Location','best');
        grid on;
        exportgraphics(f1, fullfile(caseFolder,'TractorForces.png'));
        close(f1);

        % Trailer tire forces
        Ftrailer_Rear  = Cwtr * (ans.y4.Data - ans.z4.Data); %- m_ct*lft*g/(lrt+lft) - m_urt*g;
        Ftrailer_Front = Cwtf * (ans.y3.Data - ans.z3.Data); %- m_ct*lrt*g/(lrt+lft) - m_uft*g;
        Fstat_trailer_Rear =  m_ct*lft*g/(lrt+lft) + m_urt*g;
        Fstat_trailer_Front =  m_ct*lrt*g/(lrt+lft) + m_uft*g;
        % Peak Force value
        FPeak_trailer_Rear = max(abs(Ftrailer_Rear));
        FPeak_trailer_Front = max(abs(Ftrailer_Front));
        % Force Amplification
        AF_trailer_Rear = FPeak_trailer_Rear/Fstat_trailer_Rear;
        AF_trailer_Front = FPeak_trailer_Front/Fstat_trailer_Front;
        % Settling Time
        Ts_Trailer_Front  = settling_time(t, -Ftrailer_Front) ;
        Ts_Trailer_Rear   = settling_time(t, -Ftrailer_Rear) ;
        % Force in Spatial Domain
        F3 = Ftrailer_Front;
        F4 = Ftrailer_Rear;
        x3 = Vx*(t-tref_3);
        x4 = Vx*(t-tref_4);

        % Extracting forces only along the bridge

        I3 = find(x3 >= 0 & x3 <= L);
        F3_bridge = F3(I3);
        x3_bridge = x3(I3);
        

        I4 = find(x4 >= 0 & x4 <= L);
        F4_bridge = F4(I4);
        x4_bridge = x4(I4);
        



        f2 = figure('Visible','off');
        plot(ans.tout,Ftrailer_Front,'r-'); hold on;
        plot(ans.tout,Ftrailer_Rear ,'b--');
        title(sprintf('Trailer Tire Forces (%s)', caseTag), 'Interpreter','none');
        xlabel('Time [s]'); ylabel('Force [N]');
        legend('Front','Rear','Location','best');
        grid on;
        exportgraphics(f2, fullfile(caseFolder,'TrailerForces.png'));
        close(f2);


        % STORE ALL RESULTS
        % ================================================================
        speedTag = sprintf('V%02d', Vx);

        Results.(loadStr).(speedTag).folder = caseFolder;

        Results.(loadStr).(speedTag).Fstat_tractor_Front = Fstat_tractor_Front;
        Results.(loadStr).(speedTag).Fstat_tractor_Rear  = Fstat_tractor_Rear;
        Results.(loadStr).(speedTag).Fpeak_tractor_Front = FPeak_tractor_Front;
        Results.(loadStr).(speedTag).Fpeak_tractor_Rear  = FPeak_tractor_Rear;
        Results.(loadStr).(speedTag).AF_tractor_Front    = AF_tractor_Front;
        Results.(loadStr).(speedTag).AF_tractor_Rear     = AF_tractor_Rear;

        Results.(loadStr).(speedTag).Fstat_trailer_Front = Fstat_trailer_Front;
        Results.(loadStr).(speedTag).Fstat_trailer_Rear  = Fstat_trailer_Rear;
        Results.(loadStr).(speedTag).Fpeak_trailer_Front = FPeak_trailer_Front;
        Results.(loadStr).(speedTag).Fpeak_trailer_Rear  = FPeak_trailer_Rear;
        Results.(loadStr).(speedTag).AF_trailer_Front    = AF_trailer_Front;
        Results.(loadStr).(speedTag).AF_trailer_Rear     = AF_trailer_Rear;

        Results.(loadStr).(speedTag).SettlingTime_Tractor_F     = Ts_Tractor_Front;
        Results.(loadStr).(speedTag).SettlingTime_Tractor_R     = Ts_Tractor_Rear;
        Results.(loadStr).(speedTag).SettlingTime_Trailer_F     = Ts_Trailer_Front;
        Results.(loadStr).(speedTag).SettlingTime_Trailer_R     = Ts_Trailer_Rear;

        % Force Vector over the Bridge span
        Results.(loadStr).(speedTag).Faxle1_Bridge = F1_bridge;
        Results.(loadStr).(speedTag).Faxle2_Bridge = F2_bridge;
        Results.(loadStr).(speedTag).Faxle3_Bridge = F3_bridge;
        Results.(loadStr).(speedTag).Faxle4_Bridge = F4_bridge;

        % Time instant when the axle group comes in contact with the bridge
        Results.(loadStr).(speedTag).Time_axle1_Bridge = tref_1;
        Results.(loadStr).(speedTag).Time_axle2_Bridge = tref_2;
        Results.(loadStr).(speedTag).Time_axle3_Bridge = tref_3;
        Results.(loadStr).(speedTag).Time_axle4_Bridge = tref_4;



        % Truck deflection
        f3 = figure('Visible','off');
        plot(ans.tout,ans.y.Data,'r-','LineWidth',1.2);
        title(sprintf('Truck Sprung Mass Deflection (%s)', caseTag), 'Interpreter','none');
        xlabel('Time [s]'); ylabel('Deflection [m]');
        grid on;
        exportgraphics(f3, fullfile(caseFolder,'TruckDeflection.png'));
        close(f3);

        % Trailer deflection
        f4 = figure('Visible','off');
        plot(ans.tout,ans.Y.Data,'b-','LineWidth',1.2);
        title(sprintf('Trailer Sprung Mass Deflection (%s)', caseTag), 'Interpreter','none');
        xlabel('Time [s]'); ylabel('Deflection [m]');
        grid on;
        exportgraphics(f4, fullfile(caseFolder,'TrailerDeflection.png'));
        close(f4);

        % Drawbar deflection
        f5 = figure('Visible','off');
        plot(ans.tout,ans.W.Data,'k-','LineWidth',1.2);
        title(sprintf('Drawbar Deflection (%s)', caseTag), 'Interpreter','none');
        xlabel('Time [s]'); ylabel('Deflection [m]');
        grid on;
        exportgraphics(f5, fullfile(caseFolder,'DrawbarDeflection.png'));
        close(f5);

        % Force Spatial Truck Front
        f6 = figure('Visible','off');
        plot(x1_bridge,F1_bridge,'r-','LineWidth',1.2);
        yline(-Fstat_tractor_Front,'-','Static Load');
        title(sprintf('Force along the Bridge span (%s)', caseTag), 'Interpreter','none');
        xlabel('Distance [m]'); ylabel('Force [N]');
        legend('Total Force','Location','east')
        grid on;
        exportgraphics(f6, fullfile(caseFolder,'Truck F Force along the Bridge span.png'));
        close(f6);

        % Force Spatial Truck Rear
        f7 = figure('Visible','off');
        plot(x2_bridge,F2_bridge,'r-','LineWidth',1.2);
        yline(-Fstat_tractor_Rear,'-','Static Load');
        title(sprintf('Force along the Bridge span (%s)', caseTag), 'Interpreter','none');
        xlabel('Distance [m]'); ylabel('Force [N]');
        legend('Total Force','Location','east')
        grid on;
        exportgraphics(f7, fullfile(caseFolder,'Truck R Force along the Bridge span.png'));
        close(f7);


        % Force Spatial Trailer Front
        f8 = figure('Visible','off');
        plot(x3_bridge,F3_bridge,'r-','LineWidth',1.2);
        yline(-Fstat_trailer_Front,'-','Static Load');
        title(sprintf('Force along the Bridge span (%s)', caseTag), 'Interpreter','none');
        xlabel('Distance [m]'); ylabel('Force [N]');
        legend('Total Force','Location','east')
        grid on;
        exportgraphics(f8, fullfile(caseFolder,'Trailer F Force along the Bridge span.png'));
        close(f8);


        % Force Spatial Trailer Rear
        f9 = figure('Visible','off');
        plot(x4_bridge,F4_bridge,'r-','LineWidth',1.2);
        yline(-Fstat_trailer_Rear,'-','Static Load');
        title(sprintf('Force along the Bridge span (%s)', caseTag), 'Interpreter','none');
        xlabel('Distance [m]'); ylabel('Force [N]');
        legend('Total Force','Location','east')
        grid on;
        exportgraphics(f9, fullfile(caseFolder,'Trailer R Force along the Bridge span.png'));
        close(f9);



        % % Frequency Analysis
        % fs = 20;
        % % t = ans.tout;
        % % freq = 0:fs/length(t):fs-1/fs;
        % % xn = Ftractor_Front;
        % % N = length(xn); % Number of samples
        % % xk = abs(fft(xn))/N; % Two-sided amplitude
        % % xk = xk(1:(N+1)/2); % One-sided
        % % xk(2:end-1) = 2*xk(2:end-1); % Double values except for DC and Nyquist
        % f6 = figure('Visible','off');
        % periodogram(Ftractor_Front, hamming(length(Ftractor_Front)), length(Ftractor_Front), fs, 'psd')
        % title(sprintf('Power Frequency spectrum (%s)', caseTag), 'Interpreter','none');
        % xlabel('Frequency [s]'); ylabel('Power [dB]');
        % grid on;
        % exportgraphics(f6, fullfile(caseFolder,'FrequencySpectrumTractorFront.png'));
        % close(f6);
        % 
        % 
        % f7 = figure('Visible','off');
        % periodogram(Ftractor_Rear, hamming(length(Ftractor_Rear)), length(Ftractor_Rear), fs, 'psd')
        % title(sprintf('Power Frequency spectrum (%s)', caseTag), 'Interpreter','none');
        % xlabel('Frequency [s]'); ylabel('Power [dB]');
        % grid on;
        % exportgraphics(f7, fullfile(caseFolder,'FrequencySpectrumTractorRear.png'));
        % close(f7);


    end
end

fprintf('\nSweep complete.\n');



%% Peak Forces and Force Amplification



plotFolder = 'SummaryPlots';
if ~exist(plotFolder,'dir'); mkdir(plotFolder); end

loadCases = {'FullLoad','HalfLoad','NoLoad'};
speedList = [5 10 15 20 25];
speedTags = arrayfun(@(v) sprintf('V%02d',v), speedList, 'UniformOutput',false);

% Helper extractor
getField = @(S,field) arrayfun(@(v) S.(v{1}).(field), speedTags);

colors = {'r','b','k'};      % Front / Rear
styles = {'-','-.',':'};     % Full Load / No Load


% ==================== TRACTOR PEAK FORCE =========================
figure; hold on; grid on;

for iLoad = 1:3
    LC = loadCases{iLoad};
    style = styles{iLoad};

    % Front
    PF_front = getField(Results.(LC),'Fpeak_tractor_Front');
    plot(speedList, PF_front, [colors{1} style 'o'], ...
        'LineWidth',1.5, 'DisplayName',[LC ' Front']);

    % Rear
    PF_rear  = getField(Results.(LC),'Fpeak_tractor_Rear');
    plot(speedList, PF_rear, [colors{2} style 'o'], ...
        'LineWidth',1.5, 'DisplayName',[LC ' Rear']);
end

xlabel('Velocity [m/s]');
ylabel('Peak Force [N]');
title('Tractor Peak Forces vs Velocity');
legend('Location','best');
exportgraphics(gcf, fullfile(plotFolder,'Tractor_PeakForces.png'), 'Resolution',300);
close(gcf);


% ==================== TRAILER PEAK FORCE =========================
figure; hold on; grid on;

for iLoad = 1:3
    LC = loadCases{iLoad};
    style = styles{iLoad};

    PF_front = getField(Results.(LC),'Fpeak_trailer_Front');
    PF_rear  = getField(Results.(LC),'Fpeak_trailer_Rear');

    plot(speedList, PF_front, [colors{1} style 'o'], ...
        'LineWidth',1.5,'DisplayName',[LC ' Front']);
    plot(speedList, PF_rear,  [colors{2} style 'o'], ...
        'LineWidth',1.5,'DisplayName',[LC ' Rear']);
end

xlabel('Velocity [m/s]');
ylabel('Peak Force [N]');
title('Trailer Peak Forces vs Velocity');
legend('Location','best');
exportgraphics(gcf, fullfile(plotFolder,'Trailer_PeakForces.png'), 'Resolution',300);
close(gcf);


% ==================== TRACTOR AF =========================
figure; hold on; grid on;

for iLoad = 1:3
    LC = loadCases{iLoad};
    style = styles{iLoad};

    AF_front = getField(Results.(LC),'AF_tractor_Front');
    AF_rear  = getField(Results.(LC),'AF_tractor_Rear');

    plot(speedList, AF_front, [colors{1} style 'o'], ...
        'LineWidth',1.5,'DisplayName',[LC ' Front']);
    plot(speedList, AF_rear,  [colors{2} style 'o'], ...
        'LineWidth',1.5,'DisplayName',[LC ' Rear']);
end

xlabel('Velocity [m/s]');
ylabel('Amplification Factor [-]');
title('Tractor Amplification Factor vs Velocity');
legend('Location','best');
exportgraphics(gcf, fullfile(plotFolder,'Tractor_AF.png'), 'Resolution',300);
close(gcf);


% ==================== TRAILER AF =========================
figure; hold on; grid on;

for iLoad = 1:3
    LC = loadCases{iLoad};
    style = styles{iLoad};

    AF_front = getField(Results.(LC),'AF_trailer_Front');
    AF_rear  = getField(Results.(LC),'AF_trailer_Rear');

    plot(speedList, AF_front, [colors{1} style 'o'], ...
        'LineWidth',1.5,'DisplayName',[LC ' Front']);
    plot(speedList, AF_rear,  [colors{2} style 'o'], ...
        'LineWidth',1.5,'DisplayName',[LC ' Rear']);
end

xlabel('Velocity [m/s]');
ylabel('Amplification Factor [-]');
title('Trailer Amplification Factor vs Velocity');
legend('Location','best');
exportgraphics(gcf, fullfile(plotFolder,'Trailer_AF.png'), 'Resolution',300);
close(gcf);


% ==================== TRACTOR SETTLING TIME =========================
figure; 
hold on; 
grid on;

for iLoad = 1:3
    LC = loadCases{iLoad};
    style = styles{iLoad};

    ST_front = getField(Results.(LC),'SettlingTime_Tractor_F');
    ST_rear  = getField(Results.(LC),'SettlingTime_Tractor_R');

    plot(speedList, ST_front, [colors{1} style 'o'], ...
        'LineWidth',1.5,'DisplayName',[LC ' Front']);
    plot(speedList, ST_rear,  [colors{2} style 'o'], ...
        'LineWidth',1.5,'DisplayName',[LC ' Rear']);
end

xlabel('Velocity [m/s]');
ylabel('Settling Time [Secs]');
title('Tractor Contact Force Settling Time vs Velocity');
legend('Location','best');
exportgraphics(gcf, fullfile(plotFolder,'Tractor_ST.png'), 'Resolution',300);
close(gcf);

% ==================== TRAILER SETTLING TIME =========================
figure; 
hold on;
grid on;

for iLoad = 1:3
    LC = loadCases{iLoad};
    style = styles{iLoad};

    ST_front = getField(Results.(LC),'SettlingTime_Trailer_F');
    ST_rear  = getField(Results.(LC),'SettlingTime_Trailer_R');

    plot(speedList, ST_front, [colors{1} style 'o'], ...
        'LineWidth',1.5,'DisplayName',[LC ' Front']);
    plot(speedList, ST_rear,  [colors{2} style 'o'], ...
        'LineWidth',1.5,'DisplayName',[LC ' Rear']);
end

xlabel('Velocity [m/s]');
ylabel('Settling Time [Secs]');
title('Trailer Contact Force Settling Time vs Velocity');
legend('Location','best');
exportgraphics(gcf, fullfile(plotFolder,'Trailer_ST.png'), 'Resolution',300);
close(gcf);

disp('Combined plots generated successfully!');

