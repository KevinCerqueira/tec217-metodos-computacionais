% Definindo os dados
x1 = [0 1 1 2 2 3 3 4 4]';
x2 = [0 1 2 1 2 1 2 1 2]';
y = [15.1 17.9 12.7 25.6 20.5 35.1 29.7 45.4 40.2]';

% Montando a matriz de design
X = [ones(size(x1)) x1 x2];

% Ajustando o modelo de regressão linear múltipla manualmente
b = inv(X' * X) * X' * y;

% Calculando o ajuste
y_fit = X * b;

% Calculando o erro-padrão da estimativa
n = length(y);
p = 3;  % número de parâmetros no modelo
Syx = sqrt(sum((y - y_fit).^2) / (n - p));

% Calculando o coeficiente de correlação
R = corrcoef([x1 x2 y]);

% Mostrando os coeficientes de regressão, o erro-padrão da estimativa e o coeficiente de correlação
printf("Coeficientes de regressão: b0 = %f, b1 = %f, b2 = %f\n", b(1), b(2), b(3));
printf("Erro-padrão da estimativa: Syx = %f\n", Syx);
printf("Coeficiente de correlação:\n");
disp(R);

% Criando a grade de pontos para o gráfico tridimensional
[x1_grid, x2_grid] = meshgrid(min(x1):max(x1), min(x2):max(x2));
y_grid = b(1) + b(2) * x1_grid + b(3) * x2_grid;

% Criando o gráfico tridimensional
figure;
scatter3(x1, x2, y, 'filled');
hold on;
mesh(x1_grid, x2_grid, y_grid);
hold off;
title('Regressão linear múltipla');
xlabel('x1');
ylabel('x2');
zlabel('y');
