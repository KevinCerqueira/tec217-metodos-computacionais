f = @(x) 1 - x - 4*x^3 + 2*x^5;  % Função a ser integrada
a = -2;  % Limite inferior de integração
b = 4;  % Limite superior de integração

% Cálculo da integral utilizando a regra de Simpson de 1/3 com n = 4
n = 4;  % Número de subintervalos
h = (b - a) / n;
x = linspace(a, b, n+1);
integral_value = 0;
for i = 1:2:n-1
    integral_value = integral_value + (h/3) * (f(x(i)) + 4*f(x(i+1)) + f(x(i+2)));
end

fprintf('Integral aproximada com a regra de Simpson de 1/3 (n = 4): %i\n', integral_value);

