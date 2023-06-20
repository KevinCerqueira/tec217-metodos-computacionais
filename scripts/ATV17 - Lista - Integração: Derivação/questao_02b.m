f = @(x) 8 + 4*cos(x);  % Função a ser integrada
a = 0;  % Limite inferior de integração
b = pi/2;  % Limite superior de integração
n = 10000;  % Número de pontos de amostragem

% Cálculo da integral usando a regra do trapézio
x = linspace(a, b, n+1);
h = (b - a) / n;
integral_aproximada = (h/2) * (f(a) + 2*sum(f(x(2:end-1))) + f(b));

fprintf('\n A integral aproximada é: %f\n', integral_aproximada);