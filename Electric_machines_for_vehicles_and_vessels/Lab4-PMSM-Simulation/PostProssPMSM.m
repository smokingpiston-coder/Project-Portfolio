
close all

figure
subplot(3,3,1)
plot(time,w1*30/(pi*np),'k',time,time*0+ws*30/(pi*np),'g--')
xlabel('Time (s)')
ylabel('Rotor speed (RPM mek)')
title('\omega_r black, \omega_s green')

subplot(3,3,4)
plot(time,Tem+Ter,'k',time,Tl,'g',time,Tem,'r',time,Ter,'m')
xlabel('Time (s)')
ylabel('torque (Nm)')
title('T_e black, T_L green, T_e_m red, T_e_r mag')

subplot(3,3,7)
plot(time,(unwrap(thetas)-pi/2-thetar)*180/pi,'k')
xlabel('Time (s)')
ylabel('load angle (deg)')
title('\theta_s-\pi/2-\phi_r')

subplot(3,3,2)
plot(time,isa,'k',time,isb,'g',time,isc,'b')
xlabel('Time (s)')
ylabel('Stator current (A)')
title('i_s_a black, i_s_b green, i_s_c blue')

subplot(3,3,5)
plot(time,real(iss),'k',time,imag(iss),'g')
xlabel('Time (s)')
ylabel('Stator current (A)')
title('i_s_\alpha black, i_s_\beta green')

subplot(3,3,8)
plot(time,real(idq),'k',time,imag(idq),'g')
xlabel('Time (s)')
ylabel('Stator current (A)')
title('i_d black, i_q green')

subplot(3,3,3)
plot(time,usa,'k',time,usb,'g',time,usc,'b')
xlabel('Time (s)')
ylabel('Stator voltage (V)')
title('u_s_a black, u_s_b green, u_s_c blue')

subplot(3,3,6)
plot(time,real(uss),'k',time,imag(uss),'g')
xlabel('Time (s)')
ylabel('Stator voltage (V)')
title('u_s_\alpha black, u_s_\beta green')

subplot(3,3,9)
plot(time,real(usdq),'k',time,imag(usdq),'g')
xlabel('Time (s)')
ylabel('Stator voltage (V)')
title('u_d black, u_q green')

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


