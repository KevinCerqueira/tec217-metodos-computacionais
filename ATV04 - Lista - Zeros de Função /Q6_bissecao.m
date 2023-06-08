g = 9.81;
Q = 20;
f = @(y) 1 - (Q^2 / (g * (3*y + (y^2 / 2))^3)) * (3 + y);
ezplot(f, [0, 2]);
tolerance = 0.01;  % 1% de erro
max_iterations = 20;

a = 0;
b = 2;
error = 1;
iterations = 0;
while error > tolerance && iterations < max_iterations
    c = (a + b) / 2;
    fa = 1 - (Q^2 / (g * (3*a + (a^2 / 2))^3)) * (3 + a);
    fb = 1 - (Q^2 / (g * (3*b + (b^2 / 2))^3)) * (3 + b);
    fc = 1 - (Q^2 / (g * (3*c + (c^2 / 2))^3)) * (3 + c);
    if fc == 0
        % encontrou a raiz exata
        y_critical = c;
        break
    elseif fa * fc < 0
        b = c;
    else
        a = c;
    end
    error = abs((b - a) / c);
    iterations = iterations + 1;
    fprintf("Iteração %d: y_critical = %f, erro = %f\n", iterations, c, error);
end

if iterations >= max_iterations
  fprintf("O método da bisseção não convergiu após %d iterações\n", max_iterations);
else
  fprintf("A profundidade crítica é y_critical = %f após %d iterações\n", c, iterations);
end


