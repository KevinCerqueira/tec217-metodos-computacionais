% Definindo os dados
v = [10 20 30 40 50 60 70 80]; % velocidade, m/s
F = [25 70 380 550 610 1220 830 1450]; % força, N

% Transformando os dados usando o logaritmo natural
ln_v = log(v);
ln_F = log(F);

% Aplicando a regressão linear aos valores logarítmicos
p = polyfit(ln_v, ln_F, 1);

% Obtemos log(a) e b da regressão linear
b = p(1);
log_a = p(2);

% Voltamos à escala original para obter a e b
a = exp(log_a);

% Mostrando a e b
printf("a: %f\n", a);
printf("b: %f\n", b);

% Preparando os dados para o gráfico
v_fit = linspace(min(v), max(v), 100);
F_fit = a * v_fit .^ b;

% Criando o gráfico
figure;
loglog(v, F, 'bo', v_fit, F_fit, 'r-');
title("Ajuste de modelo de potência");
xlabel("Velocidade (m/s)");
ylabel("Força (N)");
legend('Dados', 'Ajuste de modelo de potência');
