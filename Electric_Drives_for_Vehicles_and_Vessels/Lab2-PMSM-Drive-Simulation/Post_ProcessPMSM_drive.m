
close all


figure('Name','Grid connected PMSM')
subplot(3,3,1)
plot(time,w1*30/(pi*np),'k',time,time*0+ws*30/(pi*np),'g--')
xlabel('Time (s)')
ylabel('Rotor speed (RPM mek)')
legend('\omega_r','\omega_s')

subplot(3,3,4)
plot(time,Tem+Ter,'k',time,Tl,'g',time,Tem,'r',time,Ter,'m')
xlabel('Time (s)')
ylabel('torque (Nm)')
legend('T_e','T_L','T_e_m','T_e_r')

subplot(3,3,7)
plot(time,(unwrap(thetas)-pi/2-thetar)*180/pi,'k')
xlabel('Time (s)')
ylabel('load angle (deg)')
title('\theta_s-\pi/2-\phi_r')

subplot(3,3,2)
plot(time,isa,'k',time,isb,'g',time,isc,'b')
xlabel('Time (s)')
ylabel('Stator current (A)')
legend('i_s_a','i_s_b','i_s_c')

subplot(3,3,5)
plot(time,real(iss),'k',time,imag(iss),'g')
xlabel('Time (s)')
ylabel('Stator current (A)')
legend('i_s_\alpha','i_s_\beta')

subplot(3,3,8)
plot(time,real(idq),'k',time,imag(idq),'g')
xlabel('Time (s)')
ylabel('Stator current (A)')
legend('i_d','i_q')

subplot(3,3,3)
plot(time,usa,'k',time,usb,'g',time,usc,'b')
xlabel('Time (s)')
ylabel('Stator voltage (V)')
legend('u_s_a','u_s_b','u_s_c')

subplot(3,3,6)
plot(time,real(uss),'k',time,imag(uss),'g')
xlabel('Time (s)')
ylabel('Stator voltage (V)')
legend('u_s_\alpha','u_s_\beta')

subplot(3,3,9)
plot(time,real(usdq),'k',time,imag(usdq),'g')
xlabel('Time (s)')
ylabel('Stator voltage (V)')
legend('u_d','u_q')


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


figure('Name','FOC PMSM')
subplot(2,3,1)
plot(time,w1*30/(pi*np),'b')
xlabel('Time (s)')
ylabel('Rotor speed (RPM mek)')
legend('n_r')

subplot(2,3,4)
plot(time,Tem+Ter,'k',time,Tl,'g',time,Tem,'r',time,Ter,'m',time,Teref,'b')
xlabel('Time (s)')
ylabel('torque (Nm)')
legend('T_e','T_L','T_e_m','T_e_r','T_e_,_r_e_f')

subplot(2,3,2)
plot(time,real(idq),'k',time,real(idqref),'g')
xlabel('Time (s)')
ylabel('i_d (A)')
legend('i_d','i_d_,_r_e_f')

subplot(2,3,5)
plot(time,imag(idq),'k',time,imag(idqref),'g')
xlabel('Time (s)')
ylabel('i_q (A)')
legend('i_q','i_q_,_r_e_f')

subplot(2,3,3)
hold on
plot(time,time*0+min(VconvLim,Umax),'m')
plot(time,real(usdq),'b',time,real(e)*Kpcd,'b:',time,real(Icpart),'b--')
plot(time,imag(usdq),'r',time,imag(e)*Kpcq,'r:',time,imag(Icpart),'r--')
plot(time,abs(usdqunlim),'k',time,abs(usdq),'g')
hold off
xlabel('Time (s)')
ylabel('Stator voltage (V)')
legend('|u_s|_m_a_x','u_d','u_K_p_d','u_K_i_d','u_q','u_K_p_q','u_K_i_q','|u_s_,_u_n_l_i_m|','|u_s|')

subplot(2,3,6)
num = find(time>2);
hold on
plot(time,real(idq)/abs(real(idqref(num(1)))),'k',time,real(idqref)/abs(real(idqref(num(1)))),'g')
plot(time,imag(idq)/abs(imag(idqref(num(1)))),'b',time,imag(idqref)/abs(imag(idqref(num(1)))),'r')
hold off
xlabel('Time (s)')
ylabel('Current [p.u of step]')
legend('i_d','i_d_,_r_e_f','i_q','i_q_,_r_e_f')

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


