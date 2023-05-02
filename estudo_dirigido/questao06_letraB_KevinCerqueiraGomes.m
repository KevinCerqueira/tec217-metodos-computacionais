% Dados fornecidos
x = [0, 1, 2, 3, 4, 5];
fx = [0, 0.5, 0.8, 0.9, 0.941176, 0.961538];
target_fx = 0.85;

% Selecionar três pontos próximos ao valor desejado de f(x) = 0.85
target_idx = find(fx >= target_fx, 1) - 1;
selected_x = x(target_idx-1:target_idx+1);
selected_fx = fx(target_idx-1:target_idx+1);

% Função auxiliar para calcular o polinômio de Lagrange quadrático
function L = quadratic_lagrange(x, y, target)
    L = y(1)*((target - x(2))*(target - x(3))) / ((x(1) - x(2))*(x(1) - x(3))) ...
      + y(2)*((target - x(1))*(target - x(3))) / ((x(2) - x(1))*(x(2) - x(3))) ...
      + y(3)*((target - x(1))*(target - x(2))) / ((x(3) - x(1))*(x(3) - x(2)));
end

% Interpolação quadrática para encontrar x quando f(x) = 0.85
quadratic_x = quadratic_lagrange(selected_fx, selected_x, target_fx);
disp('Valor de x usando interpolação quadrática:');
disp(quadratic_x);

% Função f(x) = x^2 / (1 + x^2)
f = @(x) x.^2 ./ (1 + x.^2);

% Gráficos
figure;
plot(x, fx, 'o', 'MarkerSize', 10, 'LineWidth', 1.5);
hold on;
x_range = linspace(min(x), max(x), 100);
plot(x_range, f(x_range), 'LineWidth', 1.5);
plot(quadratic_x, target_fx, 'x', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Interpolação Quadrática');
legend('Pontos de Dados', 'Função f(x)', 'Valor Interpolado');
