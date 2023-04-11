f = @(x) x^3 - 9*x + 3;
a = input("Digite o valor de A: ");
b = input("Digite o valor de B: ");
e = 5e-4;
while (b - a) > e
    c = (a * f(b) - b * f(a)) / (f(b) - f(a));
    if f(c) == 0
        break
    elseif f(c) * f(a) < 0
        b = c;
    else
        a = c;
    end
end
fprintf("A raiz da função é aproximadamente %.6f\n", c);