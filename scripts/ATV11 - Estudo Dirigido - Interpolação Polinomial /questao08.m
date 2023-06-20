% Dados fornecidos
y = [0, 30000, 60000, 90000, 120000];
g = [9.8100, 9.7487, 9.6879, 9.6278, 9.5682];

% Interpolação usando polinômios de 1ª a 3ª ordem
target_y = 55000;
g_interpolated = zeros(1, 3);

for order = 1:3
  poly_coefficients = polyfit(y, g, order);
  g_interpolated(order) = polyval(poly_coefficients, target_y);
end

disp('Valores interpolados de g para y = 55.000 m:');
disp(g_interpolated);

% Gráficos
figure;
plot(y, g, 'o', 'MarkerSize', 10, 'LineWidth', 1.5);
hold on;

colors = ['r', 'g', 'b'];
for order = 1:3
  poly_coefficients = polyfit(y, g, order);
  y_range = linspace(min(y), max(y), 100);
  plot(y_range, polyval(poly_coefficients, y_range), colors(order), 'LineWidth', 1.5);
  plot(target_y, g_interpolated(order), 'x', 'MarkerSize', 10, 'LineWidth', 1.5, 'Color', colors(order));
end

xlabel('y (m)');
ylabel('g (m/s^2)');
title('Interpolação Polinomial para Aceleração da Gravidade');
legend('Pontos de Dados', 'Polinômio de 1ª Ordem', 'Interpolado (1ª Ordem)', ...
       'Polinômio de 2ª Ordem', 'Interpolado (2ª Ordem)', ...
       'Polinômio de 3ª Ordem', 'Interpolado (3ª Ordem)');
