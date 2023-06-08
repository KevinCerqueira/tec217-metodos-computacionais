f = @(x) exp(-x);  % Função a ser integrada
a = 0;  % Limite inferior de integração
b = 1.2;  % Limite superior de integração
n = 1;  % Número de pontos de amostragem

% Cálculo da integral usando a regra do trapézio
x = linspace(a, b, n+1);
h = (b - a) / n;
integral_value = (h/2) * (f(a) + f(b));

fprintf('\n A integral aproximada é: %f\n', integral_value);
