a = 0;
b = 0.5;

function area = trapezio_simples(f, a, b)
  h = b - a;
  area = (f(a) + f(b)) * h / 2;
end

f = @(x) (1 + x^2)^(1/2);

area = trapezio_simples(f, a, b);
disp(area);
