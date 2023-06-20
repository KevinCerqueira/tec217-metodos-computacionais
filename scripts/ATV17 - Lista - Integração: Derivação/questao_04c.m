f = @(x) exp(-x);  % Função a ser integrada
a = 0;  % Limite inferior de integração
b = 1.2;  % Limite superior de integração

% Estimativa numérica usando combinação das regras do trapézio e de Simpson
n = 4;  % Número de subintervalos
h = (b - a) / n;
x = linspace(a, b, n+1);
integral_value = 0;
for i = 1:2:n-1
    if i+1 <= n-1
        integral_value = integral_value + (h/3) * (f(x(i)) + 4*f(x(i+1)) + f(x(i+2)));
    else
        integral_value = integral_value + (h/2) * (f(x(i)) + f(x(i+1)));
    end
end

% Cálculo do erro relativo percentual
exact_value = -exp(-b) + exp(-a);
error_percent = abs(integral_value - exact_value) / exact_value * 100;

fprintf('\n A integral aproximada é: %f\n', integral_value);
fprintf('\n Erro percentual: %f\n', error_percent);

