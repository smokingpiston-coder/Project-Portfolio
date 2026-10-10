%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Post Prossessing

%%%%%%%%%%%%%%%%%
% Calculating the physical rotor curents
irralpha = real(irs).*cos(Thetar*np)+imag(irs).*sin(Thetar*np);
irrbeta = -real(irs).*sin(Thetar*np)+imag(irs).*cos(Thetar*np);

ir1=irralpha; % Phase 1
ir2=-0.5*irralpha+sqrt(3)/2*irrbeta; % Phase 2
ir3=-0.5*irralpha-sqrt(3)/2*irrbeta; % Phase 3

%%%%%%%%%%%%%%%%%
% Calculating the dq values

usd = real(uss).*cos(Psir_angle)+imag(uss).*sin(Psir_angle);
usq = -real(uss).*sin(Psir_angle)+imag(uss).*cos(Psir_angle);

isd = real(iss).*cos(Psir_angle)+imag(iss).*sin(Psir_angle);
isq = -real(iss).*sin(Psir_angle)+imag(iss).*cos(Psir_angle);

ird = real(irs).*cos(Psir_angle)+imag(irs).*sin(Psir_angle);
irq = -real(irs).*sin(Psir_angle)+imag(irs).*cos(Psir_angle);

%%%%%%%%%%%%%%%%%
% Calculating the stator powers
Ps = 3/2*real(uss.*conj(iss));
Qs = 3/2*imag(uss.*conj(iss));

figure('Name','Simulated Induction Machine direct start')
subplot(3,3,1)
hold on
plot(time,usa,'b',time,usb,'r',time,usc,'g')
plot(timelab,u1lab,'b--',timelab,u2lab,'r--',timelab,u3lab,'g--')
hold off
xlabel('time [s]')
ylabel('Stator voltage [V]')
legend('u_s_a','u_s_b','u_s_c','u_s_a_,_l_a_b','u_s_b_,_l_a_b','u_s_c_,_l_a_b')

subplot(3,3,2)
hold on
plot(time,isa,'b',time,isb,'r',time,isc,'g')
plot(timelab,i1lab,'b--',timelab,i2lab,'r--',timelab,i3lab,'g--',timelab,i3high,'m')
hold off
xlabel('time [s]')
ylabel('Stator current [A]')
legend('i_s_a','i_s_b','i_s_c','i_s_a_,_l_a_b','i_s_b_,_l_a_b','i_s_c_,_l_a_b','i_s_c_,_h_i_g_h')

subplot(3,3,4)
plot(timelab,speedlab_avg,'r',time,Wr*30/pi,'b') % Filtered speed
xlabel('time [s]')
ylabel('Rotor speed [rpm]')
legend('n_r_,_l_a_b','n_r')

subplot(3,3,8)
hold on
plot(time,ir1,'b',time,ir2,'r',time,ir3,'g')
hold off
xlabel('time [s]')
ylabel('Rotor current [A]')
legend('i_r_a','i_r_b','i_r_c')

subplot(3,3,5)
hold on
plot(time,real(iss),'b',time,imag(iss),'r')
hold off
xlabel('time [s]')
ylabel('Stator current [A]')
legend('i_s_\alpha','i_s_\beta')

subplot(3,3,7)
plot(time,Te,'b',time,TL,'r')
xlabel('time [s]')
ylabel('Torque [Nm]')
legend('T_e','T_L_,_l_a_b')

subplot(3,3,3)
plot(timelab,Pslab/1e3,'m',timelab,Qslab/1e3,'c',time,Te.*Wr/1e3,'b',time,Ps/1e3,'r',time,Qs/1e3,'g')
xlabel('time [s]')
ylabel('Power [k]')
legend('P_s_,_l_a_b','Q_s_,_l_a_b','P_m_e_k','P_s','Q_s')

subplot(3,3,6)
hold on
plot(time,usd,'b',time,usq,'r',time,sqrt((usd).^2+(usq).^2),'m')
hold off
xlabel('time [s]')
ylabel('Voltage [V]')
legend('u_s_d','u_s_q','|u_s|')

subplot(3,3,9)
hold on
plot(time,real(is),'b',time,imag(is),'r',time,abs(is),'m')
plot(time,ird,'g',time,irq,'c',time,sqrt((ird).^2+(irq).^2),'k')
hold off
xlabel('time [s]')
ylabel('Current [A]')
legend('i_s_d','i_s_q','|i_s|','i_r_d','i_r_q','|i_r|')

%%%%%%%%%%%%%%%%%
% Calculating values for the steady-state model
Us = Uspeak/sqrt(2); % Using RMS value for the calculation, stator phse voltage
ws = wslab; % Voltage frequency [rad/s]

ns = 60*(ws/(2*pi))/np; % Synchronous speed at ws [RPM]
nr = [0:0.01:0.9,0.901:0.001:0.999,0.9999999,1.005:0.001:1.1,1.11:0.01:2]*ns; % Shaft speed for calculations
s = (ns-nr)/ns; % Slip

Zs = Rs+1i*ws*Lsl; % Stator impedance
Z0 = 1i*ws*Lm*Rfe/(Rfe+1i*ws*Lm); % No-load impedance
Zr = Rr./s+1j*ws*Lrl;
Zekv = Z0.*Zr./(Z0+Zr);
Isc = Us./(Zs+Zekv);
Irc = Z0./(Z0+Zr).*Isc;
Imc = Zekv/(1j*ws*Lm).*Isc;
IRfec = Zekv/Rfe.*Isc;
Ssc = 3*Us*conj(Isc);
Psc = real(Ssc);
Qsc = imag(Ssc);
Pshaft = 3*(1-s)./s.*Rr.*abs(Irc).^2;
Tec = Pshaft./(nr*pi/30);
Pcus = 3*Rs*abs(Isc).^2;
Pcur = 3*Rr*abs(Irc).^2;
PRfe = 3*Rfe*abs(IRfec).^2;
Qxsl = 3*ws*Lsl*abs(Isc).^2;
Qxrl = 3*ws*Lrl*abs(Irc).^2;
Qxm = 3*ws*Lm*abs(Imc).^2;

eta = Pshaft./Psc;
temp = find(nr>ns);
eta(temp) = Psc(temp)./Pshaft(temp); % @ nr>ns input power is shaft power

% No-load
temp0 = find(and((time > 0.6),(time < 0.9))); % finds all elements for 0.6 < time < 0.9 s
% Load
tempL = find(and((time > 1.3),(time < 1.5))); % finds all elements for 1.3 < time < 1.5 s

figure('Name','Steady-state model')
subplot(2,3,1)
plot(nr,real(Us)+nr*0,'b',nr,imag(Us)+nr*0,'r')
xlabel('Shaft speed [RPM]')
ylabel('Stator voltage [V]')
legend('U_s_,_r_e_a_l','U_s_,_i_m_a_g')

subplot(2,3,2)
hold on
plot(nr,real(Isc),'b',nr,imag(Isc),'r',nr,abs(Isc),'g',nr,real(Irc),'m',nr,imag(Irc),'c',nr,abs(Irc),'k')
plot(nT1,IstatorT1,'g*',nT2,IsT2*400/130,'go')
hold off
xlabel('Shaft speed [RPM]')
ylabel('Stator current [A]')
legend('I_s_,_r_e_a_l','I_s_,_i_m_a_g','|I_s|','I_r_,_r_e_a_l','I_r_,_i_m_a_g','|I_r|','|I_s_T_1|','|I_s_T_2|')

subplot(2,3,3)
plot(nr,eta*100,'b')
xlabel('Shaft speed [RPM]')
ylabel('Efficency [%]')

subplot(2,3,4)
hold on
plot(nr,Psc/1e3,'b',nr,Pcus/1e3,'r',nr,PRfe/1e3,'g',nr,Pcur/1e3,'m',nr,Pshaft/1e3,'k')
plot(nT1,PstatorT1/1e3,'b*',nT1,TT1.*nT1*pi/30/1e3,'k*',nT2,pi/30*nT2.*TmeasT2*(400/130)^2/1e3,'ko')
hold off
xlabel('Shaft speed [RPM]')
ylabel('Power [kW]')
legend('P_s','P_c_u_s','P_R_f_e','P_c_u_r','P_s_h_a_f_t','P_s_T_1','P_s_h_a_f_t_T_1','P_s_h_a_f_t_T_2')

subplot(2,3,5)
hold on
plot(nr,Qsc/1e3,'b',nr,Qxsl/1e3,'r',nr,Qxm/1e3,'g',nr,Qxrl/1e3,'m')
plot(nT1,QstatorT1/1e3,'b*')
hold off
xlabel('Shaft speed [RPM]')
ylabel('Reactive Power [kVAr]')
legend('Q_s','Q_X_s_\lambda','Q_X_m','Q_X_r_\lambda','Q_s_T_1')

temp = find(Pshaft<4000 & nr>1200); % Find the rated shaft power
Tec_rated = Tec(temp(1));
srated = s(temp(1));
stemp = -0.1:0.001:0.1;

subplot(2,3,6)
hold on
plot(nr,Tec,'b')
plot(nT1,TT1,'b*',nT2,TmeasT2*(400/130)^2,'bo')
plot(nr(temp(1)),Tec_rated,'r*',ns*(1-stemp),Tec_rated/srated*stemp,'r--')
hold off
xlabel('Shaft speed [RPM]')
ylabel('Shaft Torque [Nm]')
legend('T_e','T_e_T_1','T_e_T_2','T_e_,_r_a_t_e_d','Lin approx')


