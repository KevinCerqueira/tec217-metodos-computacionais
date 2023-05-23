% Definindo os dados
x = [2 4 6 7 10 11 14 17 20];
y = [4 5 6 5 8 8 6 9 12];

% Calculando a inclinação (a1)
a1 = sum(x.*y) / sum(x.^2);

% Mostrando a inclinação
printf("Inclinação (a1): %f\n", a1);

% Preparando os dados para o gráfico
y_fit = a1 * x;

% Criando o gráfico
figure;
plot(x, y, 'bo'); % Pontos de dados originais
hold on;
plot(x, y_fit, 'r-'); % Reta ajustada
title("Ajuste por mínimos quadrados");
xlabel("x");
ylabel("y");
legend('Dados', 'Ajuste por mínimos quadrados');
hold off;
