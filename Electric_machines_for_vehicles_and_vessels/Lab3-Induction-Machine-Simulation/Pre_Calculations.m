%**********************************************************************
% Pre_Calculations.m 
% This program load the measurements from lab 2 and calculate some values
%**********************************************************************
%
workspace                                                                       %makes sure that the workspace panel is on
filebrowser                                                                     %makes sure that the folder browser is on
format compact                                                                  %suppress excess blank lines to show more output on a single screen.
set(groot,'defaultFigureCreateFcn',@(fig,~)addToolbarExplorationButtons(fig));  %add zoom buttons to the figure toolbar
set(groot,'defaultAxesCreateFcn',@(ax,~)set(ax.Toolbar,'Visible','off'));       %add zoom buttons to the figure toolbar
set(0,'defaultAxesYGrid','on');
set(0,'defaultAxesXGrid','on');

% Put in the values from Table 1 in lab 2 here
%**********************************************************************
IaT1 = [0, -5, -10, -15, -20, -23, 10]; % The set point for Ia, column 1 in Table 1
PstatorT1 = [350, 1573, 2778, 4013, 5245, 6005, -1715]; % Values from column 2 in Table 1
QstatorT1 = [3861, 3860, 3910, 4070, 4300, 4460, 4500]; % Values from column 3 in Table 1
IstatorT1 = [5.56, 5.90, 6.84, 8.15, 9.66, 10.67, 6.8]; % Values from column 4 in Table 1
nT1 = [1500, 1486, 1473, 1458, 1443, 1434, 1521]; % Values from column 5 in Table 1
TT1 = [0.33, 7.98, 15.25, 22.55, 29.75, 34.15, -13.90]; % Values from column 6 in Table 1, the 30 you should change to your value.

% Put in the values from Table 2 in lab 2 here, the values for 130 V
%**********************************************************************
nsetT2 = [1500, 1475, 1450, 1425, 1400, 1300, 1200, 1000, 500, 0]; % The set point for speed, column 1 in Table 2
nT2 = [1502, 1476, 1452, 1426, 1402, 1300, 1201, 1001, 502, 0]; % Values from column 2 in Table 2
IsT2 = [1.20, 1.84, 2.74, 3.67, 4.53, 7.38, 9.31, 11.59, 13.94, 14.7]; % Values from column 3 in Table 2
TmeasT2 = [0.05, 1.65, 2.90, 4.04, 4.91, 6.93, 7.49, 7.04, 5.20, 4.9]; % Values from column 4 in Table 2

% Loading the measurement file from lab 2
%**********************************************************************
load IMStart.txt

% When dividing the measurement file into the chanels you need to use the
% the file name, the measuremet file is loaded as a matrix with the same
% name as the file
timelab = IMStart(1,:);
u1lab = IMStart(2,:);
u2lab = IMStart(3,:);
u3lab = IMStart(4,:);
i1lab = IMStart(5,:);
i2lab = IMStart(6,:);
i3lab = IMStart(7,:);
ualab = IMStart(8,:);
ialab = IMStart(9,:);
ifeildlab = IMStart(10,:);
speedlab = IMStart(11,:)*30/pi; % To get the speed in RPM
i3high = IMStart(12,:);

% Torque constant for the DC-machine
%**********************************************************************
TorqueConst = TT1(5)/(-IaT1(5)); % Nm/A

% Calulating the alpha-beta values of voltage and current
%**********************************************************************
K = 1; % Scaling constant for the alpha-beta transformation
usslab = K*(2/3*u1lab+(-1/3+j/sqrt(3))*u2lab-(1/3+j/sqrt(3))*u3lab);
isslab = K*(2/3*i1lab+(-1/3+j/sqrt(3))*i2lab-(1/3+j/sqrt(3))*i3lab);

% Calculating the frequency of the grid voltage, the rotational speed of
% the voltage vector, and the peak voltage, the lenghth of the voltage
% vector.
%**********************************************************************
theta_uss = unwrap(angle(usslab));
temp = find(timelab > 0.05); % finds all elements for time < 0.047 s
x = [timelab(temp)',(1+0*timelab(temp)')]\theta_uss(temp)';
wslab = x(1);  % Frequency of grid voltage [rad/s]
Us_theta0 = x(2); % Initial grid angle [rad]

temp = find(and((timelab > 0.3),(timelab < 0.9))); % finds all elements for 0.3 < time < 0.9 s
Uspeak = mean(abs(usslab(temp)));
temp = find(abs(usslab)>30); % finds all elements for when |uss|>30 V
Us_step_time = timelab(temp(1));

% Calibrating the speed measurement, it has an offset and a slightly wrong
% gain, you remember that you had to push the blue “Offset adjust” button 
% and you needed to adjust the gain, we have to do the same here.
%**********************************************************************
temp = find(timelab < 0.047); % finds all elements for time < 0.047 s
Speedoff = mean(speedlab(temp)); % Offset for the speed
speedlab = speedlab-Speedoff; % Removes the offset
temp = find(and((timelab > 0.6),(timelab < 0.9))); % finds all elements for 0.6 < time < 0.9 s
SpeedGain = (wslab*30/(pi*np))/mean(speedlab(temp)); % Gain adjust for the speed
speedlab = speedlab*SpeedGain;

% Filtering the speed measurement by a moving average filter
% The speed measurement is quite noisy, this filter out the noise
k_avg = 50;
speedlab_avg = movmean(speedlab,k_avg);

% Calculating the load torque.
%**********************************************************************
TLlab = [timelab',movmean(-TorqueConst*ialab,k_avg)'];

% Calculating active and reactive power from the measurements
%**********************************************************************
Pslab = 3/2*real(usslab.*conj(isslab));
Qslab = 3/2*imag(usslab.*conj(isslab));

figure('Name','Lab 2 measurement curves')
subplot(2,4,1)
hold on
plot(timelab,u1lab,'b',timelab,u2lab,'r',timelab,u3lab,'g')
hold off
xlabel('time [s]')
ylabel('Stator voltage [V]')
legend('u_s_a','u_s_b','u_s_c')

subplot(2,4,5)
hold on
plot(timelab,real(usslab),'b',timelab,imag(usslab),'r',timelab,abs(usslab),'m',[timelab(1),timelab(end)],[Uspeak, Uspeak],'k')
text(0.1,370,['U_p_e_a_k = ',num2str(Uspeak),' V'])
hold off
xlabel('time [s]')
ylabel('Stator voltage [V]')
legend('u_s_\alpha','u_s_\beta','|u_s^s|','U_p_e_a_k')

subplot(2,4,2)
hold on
plot(timelab,i1lab,'b--',timelab,i2lab,'r--',timelab,i3lab,'g--',timelab,i3high,'m')
hold off
xlabel('time [s]')
ylabel('Stator current [A]')
legend('i_s_a','i_s_b','i_s_c','i_s_c_,_h_i_g_h')

subplot(2,4,6)
hold on
plot(timelab,real(isslab),'b',timelab,imag(isslab),'r',timelab,abs(isslab),'m')
hold off
xlabel('time [s]')
ylabel('Stator current [A]')
legend('i_s_\alpha','i_s_\beta','|i_s^s|')

subplot(2,4,3)
plot(timelab,speedlab,'r',timelab,speedlab_avg,'b')
xlabel('time [s]')
ylabel('rotor speed [rpm]')
legend('n_r','LP(n_r)')

subplot(2,4,7)
plot(timelab,-TorqueConst*ialab,'g',timelab,movmean(-TorqueConst*ialab,k_avg),'b')
xlabel('time [s]')
ylabel('Load Torque [Nm]')
legend('T_L','LP(T_L)')

subplot(2,4,4)
plot(timelab,u1lab.*i1lab/1e3,'b',timelab,Pslab/1e3,'m',timelab,Qslab/1e3,'c')
xlabel('time [s]')
ylabel('Power [kW and kVAr]')
legend('P_s_a','P_s','Q_s')

subplot(2,4,8)
plot(timelab,theta_uss,'b',timelab,timelab*wslab+Us_theta0,'r--')
xlabel('time [s]')
ylabel('angle [rad]')
legend('angle(u_s^s)','fitted line')
text(0.1,350,['ws = ',num2str(wslab),' rad/s'])
text(0.1,450,['fs = ',num2str(wslab/(2*pi)),' Hz'])

