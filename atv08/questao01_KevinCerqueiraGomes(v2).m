% Conjunto de dados
X = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10];
Y = [1.3; 3.5; 4.2; 5.0; 7.0; 8.8; 10.1; 12.5; 13.0; 14.6];

% Número de pontos
n = length(X);

% Cálculo dos coeficientes da reta de mínimos quadrados
A = [X ones(n, 1)];
coeffs = (A' * A) \ (A' * Y); % Solução usando a inversa de A'*A

% Coeficientes da reta
a = coeffs(1);
b = coeffs(2);

% Predição dos valores estimados
Y_estimado = a * X + b;

% Cálculo do desvio padrão total
media_Y = mean(Y);
desvio_total = sqrt(sum((Y - media_Y) .^ 2) / (n - 1));

% Cálculo do erro-padrão da estimativa
erro_estimativa = sqrt(sum((Y - Y_estimado) .^ 2) / (n - 2));

% Cálculo do coeficiente de determinação (R-quadrado)
SQR = sum((Y_estimado - media_Y) .^ 2);
SQT = sum((Y - media_Y) .^ 2);
R_quadrado = SQR / SQT;

% Imprimir os resultados
fprintf('Coeficientes da reta:\n');
fprintf('a = %.4f\n', a);
fprintf('b = %.4f\n\n', b);

fprintf('Desvio padrão total: %.4f\n', desvio_total);
fprintf('Erro-padrão da estimativa: %.4f\n', erro_estimativa);
fprintf('Coeficiente de determinação (R-quadrado): %.4f\n\n', R_quadrado);

% Gráfico
figure;
plot(X, Y, 'bo', 'MarkerSize', 8); % Pontos originais
hold on;
plot(X, Y_estimado, 'r-', 'LineWidth', 2); % Reta de ajuste
xlabel('X');
ylabel('Y');
legend('Dados originais', 'Reta de ajuste');
title('Ajuste Linear utilizando Mínimos Quadrados');
grid on;
