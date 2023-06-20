f = @(x) 1 - x - 4*x^3 + 2*x^5;  % Função a ser integrada
a = -2;  % Limite inferior de integração
b = 4;  % Limite superior de integração

% Cálculo da integral utilizando a regra de Simpson de 1/3
n = 2;  % Número de subintervalos
h = (b - a) / n;
x = linspace(a, b, n+1);
integral_value = (h/3) * (f(x(1)) + 4*f(x(2)) + f(x(3)));

fprintf('\nIntegral aproximada com a regra de Simpson de 1/3: %i\n', integral_value);
