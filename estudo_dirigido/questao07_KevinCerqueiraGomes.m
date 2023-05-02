% Dados fornecidos
i = [-1, -0.5, -0.25, 0.25, 0.5, 1];
V = [-637, -96.5, -20.5, 20.5, 96.5, 637];

% Ajustar um polinômio interpolador de quinto grau aos dados
poly_coefficients = polyfit(i, V, 5);

% Calcular V para i = 0.10 usando o polinômio ajustado
target_i = 0.10;
predicted_V = polyval(poly_coefficients, target_i);
disp('Valor de V para i = 0.10:');
disp(predicted_V);

% Gráficos
figure;
plot(i, V, 'o', 'MarkerSize', 10, 'LineWidth', 1.5);
hold on;
i_range = linspace(min(i), max(i), 100);
plot(i_range, polyval(poly_coefficients, i_range), 'LineWidth', 1.5);
plot(target_i, predicted_V, 'x', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('i');
ylabel('V');
title('Polinômio Interpolador de Quinto Grau');
legend('Pontos de Dados', 'Polinômio Ajustado', 'Valor Interpolado');
