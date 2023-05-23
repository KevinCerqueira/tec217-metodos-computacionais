% Definindo os dados
t = [4 8 12 16 20 24]; % tempo, h
c = [1600 1320 1000 890 650 560]; % concentração, UFC/100ml

% Transformando os dados usando o logaritmo natural
ln_c = log(c);

% Aplicando a regressão linear aos valores logarítmicos
p = polyfit(t, ln_c, 1);

% Obtemos b e log(a) da regressão linear
b = p(1);
log_a = p(2);

% Voltamos à escala original para obter a
a = exp(log_a);

% Mostrando a
printf("Concentração no fim da tempestade (t = 0): %f UFC/100ml\n", a);

% Calculando o instante de tempo em que a concentração alcançará 200 UFC/100ml
t_200 = (log(200) - log_a) / b;

% Mostrando t_200
printf("Instante de tempo em que a concentração alcançará 200 UFC/100ml: %f h\n", t_200);

% Preparando os dados para o gráfico
t_fit = linspace(min(t), max(t), 100);
c_fit = a * exp(b * t_fit);

% Criando o gráfico
figure;
plot(t, c, 'bo', t_fit, c_fit, 'r-');
title("Ajuste de modelo exponencial");
xlabel("Tempo (h)");
ylabel("Concentração (UFC/100ml)");
legend('Dados', 'Ajuste de modelo exponencial');
