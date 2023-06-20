f = @(x) 1 - exp(-x);
a = 0;
b = 4;

n = 3; % número de subintervalos
h = (b - a) / n;
x = linspace(a, b, n+1);
y = f(x);

integral_aproximada = (3 * h / 8) * (y(1) + 3*y(2) + 3*y(3) + y(4));

fprintf('Integral aproximada com a regra de Simpson de 3/8: %f\n', integral_aproximada);
