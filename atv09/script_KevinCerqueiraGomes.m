% Dados de entrada
X = [0; 1; 2; 3; 4; 5];
Y = [0; 20; 60; 68; 77; 100];

% Ajuste de regressão de primeira ordem
A1 = [X ones(size(X))];
coef1 = pinv(A1) * Y;

% Ajuste de regressão de quinta ordem
A5 = [X.^5 X.^4 X.^3 X.^2 X ones(size(X))];
coef5 = pinv(A5) * Y;

% Cálculo dos valores ajustados para cada polinômio
X_fit = linspace(0, 5, 100)';
Y_fit_1 = coef1(1) * X_fit + coef1(2);
Y_fit_5 = coef5(1) * X_fit.^5 + coef5(2) * X_fit.^4 + coef5(3) * X_fit.^3 + coef5(4) * X_fit.^2 + coef5(5) * X_fit + coef5(6);

% Cálculo do coeficiente de determinação (R²) para cada polinômio
Y_mean = mean(Y);
SS_total = sum((Y - Y_mean).^2);
SS_residual_1 = sum((Y - (coef1(1) * X + coef1(2))).^2);
SS_residual_5 = sum((Y - (coef5(1) * X.^5 + coef5(2) * X.^4 + coef5(3) * X.^3 + coef5(4) * X.^2 + coef5(5) * X + coef5(6))).^2);
R2_1 = 1 - SS_residual_1 / SS_total;
R2_5 = 1 - SS_residual_5 / SS_total;

% Gráfico dos valores ajustados e pontos da tabela
figure;
hold on;
plot(X_fit, Y_fit_1, 'b', 'LineWidth', 2);
plot(X_fit, Y_fit_5, 'r', 'LineWidth', 2);
plot(X, Y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
legend('Regressão 1ª ordem', 'Regressão 5ª ordem', 'Pontos', 'Location', 'northwest');
xlabel('X');
ylabel('Y');
title('Ajuste Polinomial com Mínimos Quadrados');
grid on;
hold off;

% Resultados
fprintf('Coeficientes da regressão de primeira ordem:\n');
disp(coef1');
fprintf('Coeficientes da regressão de quinta ordem:\n');
disp(coef5');
fprintf('Coeficiente de determinação (R²) para a regressão de primeira ordem: %.4f\n', R2_1);
fprintf('Coeficiente de determinação (R²) para a regressão de quinta ordem: %.4f\n', R2_5);
