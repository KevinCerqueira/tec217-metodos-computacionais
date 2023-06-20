f = @(x) 1 - exp(-x);
a = 0;
b = 4;

n = 5; % número de subintervalos
h = (b - a) / n;
x = linspace(a, b, n+1);
y = f(x);

integral_aproximada = 0;

for i = 1:2:n-2
    integral_aproximada = integral_aproximada + (h / 3) * (y(i) + 4 * y(i+1) + y(i+2));
end

integral_aproximada = integral_aproximada + (h / 8) * (y(n-2) + 3 * y(n-1) + y(n));

fprintf('Integral aproximada com a regra de Simpson (n = 5): %f\n', integral_aproximada);
