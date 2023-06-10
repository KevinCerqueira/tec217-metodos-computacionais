f = @(x) (x/2)^2 - sin(x);
a = 1;
b = 2;
e = 1e-6;

% Inicializa variáveis para guardar a evolução do método
iter = 0;
Xr = [];
fa = [];
fb = [];
fc = [];
erro_aprox = [];
erro_verd = [];

while abs(b - a) > e
    iter = iter + 1;
    c = (a + b) / 2;
    Xr = [Xr c];
    fa = [fa f(a)];
    fb = [fb f(b)];
    fc = [fc f(c)];
    if f(c) == 0
        break
    elseif f(c) * f(a) < 0
        b = c;
    else
        a = c;
    end
    erro_aprox = [erro_aprox abs((b-a)/2)];
    erro_verd = [erro_verd abs((c-1.89549426703e-01)/1.89549426703e-01)];
end

% Imprime a evolução do método
fprintf("Iter | a       | b       | Xr      | f(Xr)   | erro_aprox | erro_verd\n");
fprintf("---------------------------------------------------------------------\n");
for i = 1:length(Xr)
    fprintf("%d    | %.6f | %.6f | %.6f | %.6f | %.6f    | %.6f\n", i, a, b, Xr(i), fc(i), erro_aprox(i), erro_verd(i));
end

% Plota o erro aproximado e verdadeiro
figure();
semilogy(erro_aprox);
hold on;
semilogy(erro_verd);
legend("Erro aproximado", "Erro verdadeiro");
xlabel("Iteração");
ylabel("Erro");
