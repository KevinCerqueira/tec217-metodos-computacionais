x = pi/4;  % Valor de x
h = pi/12;  % Valor de h

% Aproximação por diferença progressiva de O(h)
approx_progressive_1 = (cos(x + h) - cos(x)) / h;

% Aproximação por diferença regressiva de O(h)
approx_regressive_1 = (cos(x) - cos(x - h)) / h;

% Aproximação por diferença centrada de O(h^2)
approx_centered_2 = (cos(x + h) - cos(x - h)) / (2*h);

% Aproximação por diferença centrada de O(h^4)
approx_centered_4 = (-cos(x + 2*h) + 8*cos(x + h) - 8*cos(x - h) + cos(x - 2*h)) / (12*h);

% Derivada exata
exact_derivative = -sin(x);

% Cálculo do erro relativo percentual verdadeiro
error_true_progressive_1 = abs(approx_progressive_1 - exact_derivative) / abs(exact_derivative) * 100;
error_true_regressive_1 = abs(approx_regressive_1 - exact_derivative) / abs(exact_derivative) * 100;
error_true_centered_2 = abs(approx_centered_2 - exact_derivative) / abs(exact_derivative) * 100;
error_true_centered_4 = abs(approx_centered_4 - exact_derivative) / abs(exact_derivative) * 100;

fprintf('Aproximação por diferença progressiva de O(h): %.6f\n', -approx_progressive_1);
fprintf('Erro relativo percentual verdadeiro: %.6f%%\n\n', error_true_progressive_1);

fprintf('Aproximação por diferença regressiva de O(h): %.6f\n', -approx_regressive_1);
fprintf('Erro relativo percentual verdadeiro: %.6f%%\n\n', error_true_regressive_1);

fprintf('Aproximação por diferença centrada de O(h^2): %.6f\n', -approx_centered_2);
fprintf('Erro relativo percentual verdadeiro: %.6f%%\n\n', error_true_centered_2);

fprintf('Aproximação por diferença centrada de O(h^4): %.6f\n', -approx_centered_4);
fprintf('Erro relativo percentual verdadeiro: %.6f%%\n', error_true_centered_4);

