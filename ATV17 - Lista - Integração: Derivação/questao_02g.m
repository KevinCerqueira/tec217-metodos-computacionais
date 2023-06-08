f = @(x) 8 + 4*cos(x);  % Função a ser integrada
a = 0;  % Limite inferior de integração
b = pi/2;  % Limite superior de integração

% Cálculo da integral utilizando a regra de Simpson com n = 5
n = 5;  % Número de subintervalos
h = (b - a) / n;
x = linspace(a, b, n+1);
integral_value = 0;
for i = 1:n
    if i == 1 || i == n
        integral_value = integral_value + (h/3) * f(x(i));
    elseif mod(i, 2) == 0
        integral_value = integral_value + (h/3) * 4 * f(x(i));
    else
        integral_value = integral_value + (h/3) * 2 * f(x(i));
    end
end

fprintf('\nIntegral aproximada com a regra de Simpson (n = 5): %f\n', integral_value);
