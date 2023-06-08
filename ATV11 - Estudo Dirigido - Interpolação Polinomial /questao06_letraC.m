% Dados fornecidos
x = [0, 1, 2, 3, 4, 5];
fx = [0, 0.5, 0.8, 0.9, 0.941176, 0.961538];
target_fx = 0.85;

% Ajustar um polinômio cúbico aos dados
poly_coefficients = polyfit(x, fx, 3);

% Função auxiliar para encontrar a raiz usando bissecção
% ... (sem alterações, conforme o exemplo anterior)

% Definir a função polinomial cúbica ajustada
cubic_poly = @(x) polyval(poly_coefficients, x) - target_fx;

% Limites iniciais para bissecção
a = 1;
b = 5;

% Tolerância para bissecção
tol = 1e-6;

% Encontrar a raiz usando bissecção
cubic_x = bisection(cubic_poly, a, b, tol);
disp('Valor de x usando interpolação cúbica e bissecção:');
disp(cubic_x);

% Gráficos
figure;
plot(x, fx, 'o', 'MarkerSize', 10, 'LineWidth', 1.5);
hold on;
x_range = linspace(min(x), max(x), 100);
plot(x_range, f(x_range), 'LineWidth', 1.5);
plot(cubic_x, target_fx, 'x', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Interpolação Cúbica e Bissecção');
legend('Pontos de Dados', 'Função f(x)', 'Valor Interpolado');
