% Definindo os dados do problema 4
v = [10 20 30 40 50 60 70 80]; % velocidade, m/s
F = [25 70 380 550 610 1220 830 1450]; % força, N

% Ajustando uma parábola aos dados
p = polyfit(v, F, 2);

% Determinando os coeficientes da parábola
a = p(1);
b = p(2);
c = p(3);

% Preparando os dados para o gráfico
v_fit = linspace(min(v), max(v), 100);
F_fit = a * v_fit.^2 + b * v_fit + c;

% Calculando r^2
F_mean = mean(F);
SSR = sum((F_fit - F_mean).^2);
SST = sum((F - F_mean).^2);
r2 = SSR / SST;

% Mostrando r^2
printf("r^2: %f\n", r2);

% Criando o gráfico
figure;
plot(v, F, 'bo', v_fit, F_fit, 'r-');
title("Ajuste de parábola");
xlabel("Velocidade (m/s)");
ylabel("Força (N)");
legend('Dados', 'Ajuste de parábola');
