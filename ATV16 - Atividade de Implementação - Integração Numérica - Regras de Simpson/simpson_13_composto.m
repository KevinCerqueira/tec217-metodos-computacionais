f = @(x) x.^2;  % função a ser integrada
a = 0;  % limite inferior
b = 1;  % limite superior
n = 10;  % número de segmentos

function I = Simpson13Composto(f, a, b, n)
  h = (b - a) / n;
  x = a:h:b;
  y = arrayfun(f, x);
  
  I = h / 3 * (y(1) + 4 * sum(y(2:2:n)) + 2 * sum(y(3:2:n-1)) + y(n+1));
end

resultado = Simpson13Composto(f, a, b, n);
disp(['O valor da integral é: ', num2str(resultado)])
