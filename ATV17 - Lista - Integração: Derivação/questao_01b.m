f = @(x) 1 - exp(-x);
a = 0;
b = 4;
n = 100; % número de subintervalos
h = (b - a) / n; % tamanho de cada subintervalo
x = linspace(a, b, n+1);
y = f(x);
integral_aproximada = h * (sum(y) - (y(1) + y(end))/2);

fprintf('A integral aproximada é: %f\n', integral_aproximada);
