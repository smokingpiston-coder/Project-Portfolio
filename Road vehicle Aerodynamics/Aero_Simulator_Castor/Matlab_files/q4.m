data.m  = 1300;
data.v  = 46.0869;
data.mu = 1.5;

% Case 1 - variation of mu
i=0;
for cla = -0.4:0.1:6.0
    i = i+1;
    mu_syms(i) = cla_variation(cla, data.m, 0, data.v);
end
x_values = -0.4:0.1:6.0;
mu_graph = double(mu_syms);
f1 = figure;

% Case 2 - variation of m
i=0;
for cla = -0.4:0.1:6.0
    i = i+1;
    m_syms(i) = cla_variation(cla, 0, data.mu, data.v);
end
m_graph = double(m_syms);
f2 = figure;

% Case 3 - variation of v
i=0;
for cla = -0.4:0.1:6.0
    i = i+1;
    vel_syms(i) = cla_variation(cla, data.m, data.mu, 0);
end
v_graph = double(vel_syms);
f3 = figure;

subplot(1,3,1);
plot(x_values, mu_graph);
xlabel('-Cl*A');
ylabel('Friction coefficient');
grid on;
hold off

subplot(1,3,2);
plot(x_values, m_graph);
xlabel('-Cl*A');
ylabel('Mass');
grid on;
hold off

subplot(1,3,3);
plot(x_values, v_graph);
xlabel('-Cl*A');
ylabel('Velocity');
grid on;
hold off
