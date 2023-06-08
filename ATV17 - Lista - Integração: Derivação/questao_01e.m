f = @(x) 1 - exp(-x);
a = 0;
b = 4;

n = 4; % número de subintervalos
h = (b - a) / n;
x = linspace(a, b, n+1);
y = f(x);

integral_aproximada = 0;

for i = 1:2:n-1
    integral_aproximada = integral_aproximada + (h / 3) * (y(i) + 4 * y(i+1) + y(i+2));
end

fprintf('Integral aproximada com a regra de Simpson de 1/3 (n = 4): %f\n', integral_aproximada);
