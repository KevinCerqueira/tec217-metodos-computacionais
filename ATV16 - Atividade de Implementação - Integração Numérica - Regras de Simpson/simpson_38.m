f = @(x) x.^2;  % função a ser integrada
a = 0;  % limite inferior
b = 1;  % limite superior


function I = Simpson38(f, a, b)
  h = (b - a) / 3;
  x = a:h:b;
  y = arrayfun(f, x);
  I = 3 * h * (y(1) + 3 * (y(2) + y(3)) + y(4)) / 8;
end
resultado = Simpson38(f, a, b);
disp(['O valor da integral é: ', num2str(resultado)])
