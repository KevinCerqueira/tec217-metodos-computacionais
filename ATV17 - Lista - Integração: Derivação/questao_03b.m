f = @(x) 1 - x - 4*x^3 + 2*x^5;  % Função a ser integrada
a = -2;  % Limite inferior de integração
b = 4;  % Limite superior de integração
n = 1;  % Número de pontos de amostragem

% Cálculo da integral usando a regra do trapézio
x = linspace(a, b, n+1);
h = (b - a) / n;
integral_value = (h/2) * (f(a) + f(b));

fprintf('\n A integral aproximada é: %i\n', integral_value);