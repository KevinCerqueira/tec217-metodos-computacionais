f = @(x) (x/2).^2 - sin(x);
x = linspace(-10, 10, 1000);
plot(x, f(x))