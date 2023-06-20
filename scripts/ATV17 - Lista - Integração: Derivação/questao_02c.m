f = @(x) 8 + 4*cos(x);  % Função a ser integrada
a = 0;  % Limite inferior de integração
b = pi/2;  % Limite superior de integração

% Cálculo da integral com n = 2 (aplicações múltiplas da regra do trapézio)
n = 2;  % Número de subintervalos
h = (b - a) / n;
x = linspace(a, b, n+1);
integral_value_n2 = 0;
for i = 1:n
    integral_value_n2 = integral_value_n2 + (h/2) * (f(x(i)) + f(x(i+1)));
end

% Cálculo da integral com n = 4 (aplicações múltiplas da regra do trapézio)
n = 4;  % Número de subintervalos
h = (b - a) / n;
x = linspace(a, b, n+1);
integral_value_n4 = 0;
for i = 1:n
    integral_value_n4 = integral_value_n4 + (h/2) * (f(x(i)) + f(x(i+1)));
end

fprintf('\nIntegral aproximada com n = 2: %f\n', integral_value_n2);
fprintf('Integral aproximada com n = 4: %f\n', integral_value_n4);
