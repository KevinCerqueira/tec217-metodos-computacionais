% Definindo os dados
x = [0 2 4 6 9 11 12 15 17 19];
y = [5 6 7 6 9 8 8 10 12 12];

% Calculando a inclinação (a1) e a interseção (a0)
n = length(x);
a1 = (n*sum(x.*y) - sum(x)*sum(y)) / (n*sum(x.^2) - sum(x)^2);
a0 = mean(y) - a1*mean(x);

% Calculando y estimado
y_est = a1*x + a0;

% Calculando o erro padrão da estimativa (SEE)
SEE = sqrt(sum((y - y_est).^2) / (n - 2));

% Calculando o coeficiente de correlação (r)
r = a1 * std(x) / std(y);

% Mostrando a inclinação, a interseção, o SEE e r
printf("Inclinação (a1): %f\n", a1);
printf("Interseção (a0): %f\n", a0);
printf("Erro padrão da estimativa (SEE): %f\n", SEE);
printf("Coeficiente de correlação (r): %f\n", r);

% Preparando os dados para o gráfico
figure;
plot(x, y, 'bo'); % Pontos de dados originais
hold on;
plot(x, y_est, 'r-'); % Reta ajustada
title("Regressão por mínimos quadrados");
xlabel("x");
ylabel("y");
legend('Dados', 'Regressão por mínimos quadrados');
hold off;
