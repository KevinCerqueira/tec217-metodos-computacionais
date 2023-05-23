% Trocando as variáveis e repetindo o processo
a1_yx = (n*sum(x.*y) - sum(y)*sum(x)) / (n*sum(y.^2) - sum(y)^2);
a0_yx = mean(x) - a1_yx*mean(y);

% Calculando x estimado
x_est = a1_yx*y + a0_yx;

% Calculando o erro padrão da estimativa (SEE)
SEE_yx = sqrt(sum((x - x_est).^2) / (n - 2));

% Calculando o coeficiente de correlação (r)
r_yx = a1_yx * std(y) / std(x);

% Mostrando a inclinação, a interseção, o SEE e r
printf("Inclinação (a1_yx): %f\n", a1_yx);
printf("Interseção (a0_yx): %f\n", a0_yx);
printf("Erro padrão da estimativa (SEE_yx): %f\n", SEE_yx);
printf("Coeficiente de correlação (r_yx): %f\n", r_yx);

% Preparando os dados para o gráfico
figure;
plot(y, x, 'bo'); % Pontos de dados originais
hold on;
plot(y, x_est, 'r-'); % Reta ajustada
title("Regressão de x versus y");
xlabel("y");
ylabel("x");
legend('Dados', 'Regressão de x versus y');
hold off;
