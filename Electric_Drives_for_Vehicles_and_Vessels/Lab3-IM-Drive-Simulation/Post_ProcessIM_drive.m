
close all

%**********************************************************************
% Current controller                                                  *
%**********************************************************************
figure('Name','Current controller')
subplot(2,3,1)
plot(time,PsiRref,'--r',time,PsiRhat,'k',time,PsiR,'--g')
grid on
xlabel('Time (s)')
ylabel('Rotor flux (Wb)')
legend('\Psi_R_,_r_e_f','\Psi_R_,_h_a_t','\Psi_R')

subplot(2,3,2)
plot(time,real(idqref),'--r',time,real(idqhat),'k',time,real(idq),'--g')
grid on
xlabel('Time (s)')
ylabel('i_d (A)')
legend('i_d_,_r_e_f','i_d_,_h_a_t','i_d')

subplot(2,3,3)
hold on
plot(time,real(usdq),'b',time,imag(usdq),'r',time,abs(usdq),'g')
plot(time,real(usdqunlim),'b--',time,imag(usdqunlim),'r--',time,abs(usdqunlim),'g--')
plot(time,real(Pcpart),'m--',time,real(Icpart),'k--',time,imag(Pcpart),'m',time,imag(Icpart),'k')
hold off
grid on
xlabel('Time (s)')
ylabel('Voltage (V)')
legend('u_s_d','u_s_q',',|u_s|','u_s_d_,_u_n_l_i_m','u_s_q_,_u_n_l_i_m','|u_s_,_u_n_l_i_m|','u_P_d','u_I_d','u_P_q','u_I_q')

subplot(2,3,4)
plot(time,Teref,'r',time,Te,'--g',time,Tload,'m--')
grid on
xlabel('Time (s)')
ylabel('Torque (Nm)')
legend('T_e_,_r_e_f','T_e','T_L')

subplot(2,3,5)
plot(time,imag(idqref),'--r',time,imag(idqhat),'k',time,imag(idq),'--g')
grid on
xlabel('Time (s)')
ylabel('i_q (A)')
legend('i_q_,_r_e_f','i_q_,_h_a_t','i_q')

subplot(2,3,6)
plot(time,Wrref*30/pi,'r--',time,Wr*30/pi,'g--')
grid on
xlabel('Time (s)')
ylabel('Rotor Speed (RPM)')
legend('\Omega_r_,_r_e_f','\Omega_r')

FigH = gcf;
Axes_count = 1;
for child_counter = 1:size(FigH.Children)
    if strcmp(FigH.Children(child_counter).Type, 'axes')
    Axes_vect(Axes_count) = FigH.Children(child_counter);
    Axes_count = Axes_count + 1;
    end
end
linkaxes(Axes_vect, 'x')
% linkaxes(Axes_vect, 'y')
% linkaxes(Axes_vect, 'xy')
clear Axes_count child_counter FigH Axes_vect

%**********************************************************************
% Current model flux observer                                                    *
%**********************************************************************
figure('Name','Current model flux observer')
subplot(2,3,1)
plot(time,unwrap(thetahat)*180/pi,'k',time,unwrap(Psir_angle)*180/pi,'g--')
grid on
xlabel('Time (s)')
ylabel('Rotor flux angle (deg)')
legend('\theta_\Psi_R_,_h_a_t','\theta_\Psi_R')

subplot(2,3,4)
plot(time,(unwrap(Psir_angle)-unwrap(thetahat))*180/pi,'k')
grid on
xlabel('Time (s)')
ylabel('Rotor flux angle error (deg)')
legend('\theta_\Psi_R - \theta_\Psi_R_,_h_a_t')

subplot(2,3,2)
plot(time,w1hat/(2*pi),'k',time,w1/(2*pi),'--g')
grid on
xlabel('Time (s)')
ylabel('Stator frequency (Hz)')
legend('\omega_1_,_h_a_t','\omega_1')

subplot(2,3,5)
plot(time,(w1-w1hat)/(2*pi),'k')
grid on
xlabel('Time (s)')
ylabel('Stator frequency error (Hz)')
legend('\omega_1 - \omega_1_,_h_a_t')

subplot(2,3,3)
plot(time,PsiRref,'--r',time,PsiRhat,'k',time,PsiR,'--g')
grid on
xlabel('Time (s)')
ylabel('Rotor flux (Wb)')
legend('\Psi_R_,_r_e_f','\Psi_R_,_h_a_t','\Psi_R')

subplot(2,3,6)
plot(time,PsiR-PsiRhat,'k')
grid on
xlabel('Time (s)')
ylabel('Rotor flux error (Wb)')
legend('\Psi_R - \Psi_R_,_h_a_t')

FigH = gcf;
Axes_count = 1;
for child_counter = 1:size(FigH.Children)
    if strcmp(FigH.Children(child_counter).Type, 'axes')
    Axes_vect(Axes_count) = FigH.Children(child_counter);
    Axes_count = Axes_count + 1;
    end
end
linkaxes(Axes_vect, 'x')
% linkaxes(Axes_vect, 'y')
% linkaxes(Axes_vect, 'xy')
clear Axes_count child_counter FigH Axes_vect

%**********************************************************************
% Speed controller                                                    *
%**********************************************************************
figure('Name','Speed controller ')
subplot(1,2,1)
plot(time,Wrref*30/pi,'r--',time,Wr*30/pi,'g--')
grid on
xlabel('Time (s)')
ylabel('Rotor Speed (RPM)')
legend('\Omega_r_,_r_e_f','\Omega_r')

subplot(1,2,2)
plot(time,Telim,'k',time,Teref,'r',time,Te,'--g',time,Tload,'m--')
grid on
xlabel('Time (s)')
ylabel('Torque (Nm)')
legend('T_e_,_l_i_m','T_e_,_r_e_f','T_e','T_L')

FigH = gcf;
Axes_count = 1;
for child_counter = 1:size(FigH.Children)
    if strcmp(FigH.Children(child_counter).Type, 'axes')
    Axes_vect(Axes_count) = FigH.Children(child_counter);
    Axes_count = Axes_count + 1;
    end
end
linkaxes(Axes_vect, 'x')
% linkaxes(Axes_vect, 'y')
% linkaxes(Axes_vect, 'xy')
clear Axes_count child_counter FigH Axes_vect

