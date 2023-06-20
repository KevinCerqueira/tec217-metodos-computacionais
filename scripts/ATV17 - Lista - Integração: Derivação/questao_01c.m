f = @(x) 1 - exp(-x);
a = 0;
b = 4;

% n = 2
n = 2;
h = (b - a) / n;
x = linspace(a, b, n+1);
y = f(x);
integral_aproximada_n2 = h * (sum(y) - (y(1) + y(end))/2);

% n = 4
n = 4;
h = (b - a) / n;
x = linspace(a, b, n+1);
y = f(x);
integral_aproximada_n4 = h * (sum(y) - (y(1) + y(end))/2);

fprintf('Integral aproximada com n = 2: %f\n', integral_aproximada_n2);
fprintf('Integral aproximada com n = 4: %f\n', integral_aproximada_n4);
