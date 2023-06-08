f = @(x) 1 - exp(-x);
a = 0;
b = 4;

n = 2; % número de subintervalos
h = (b - a) / n;
x = linspace(a, b, n+1);
y = f(x);

integral_aproximada = (h / 3) * (y(1) + 4*y(2) + y(3));

fprintf('Integral aproximada com a regra de Simpson de 1/3: %f\n', integral_aproximada);
