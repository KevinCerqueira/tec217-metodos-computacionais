f = @(x) x.^3 - 9*x + 3;
x = linspace(-10, 10, 1000);
plot(x, f(x))