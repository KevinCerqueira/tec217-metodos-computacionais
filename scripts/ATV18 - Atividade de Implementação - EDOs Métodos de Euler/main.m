h = 0.0001;
t_end = 0.02;
conv_threshold = 1e-6;  % Para o método de Heun com critério de convergência

I_euler = euler(h, t_end);
I_heun = heun(h, t_end);
I_heun_conv = heun_convergente(h, t_end, conv_threshold);
I_midpoint = ponto_medio(h, t_end);

fprintf('Método de Euler: %f\n', I_euler(end));
fprintf('Euler Modificado – Heun: %f\n', I_heun(end));
fprintf('Euler Modificado – Heun com critério de convergência na etapa corretora: %f\n', I_heun_conv(end));
fprintf('Euler Ponto Médio: %f\n', I_midpoint(end));

t = 0:h:t_end-h;
figure
plot(t, I_euler, t, I_heun, t, I_heun_conv, t, I_midpoint)
legend('Euler', 'Heun', 'Heun com convergência', 'Ponto Médio')
xlabel('Tempo (s)')
ylabel('Corrente (A)')
