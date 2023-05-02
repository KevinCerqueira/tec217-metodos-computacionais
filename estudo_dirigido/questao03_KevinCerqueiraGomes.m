% Dados fornecidos
x = [1, 2, 3, 4, 5, 6, 7];
fx = [3.6, 1.8, 1.2, 0.9, 0.72, 1.5, 0.51429];

% Valor de f(x) desejado
target_fx = 1.7;

% Interpolação inversa com polinômio interpolador cúbico
xi = linspace(2, 3, 100); % Valores de x no intervalo [2, 3]
p_inv = polyfit(fx, x, 3); % Ajustar um polinômio cúbico aos dados invertidos
yi_inv = polyval(p_inv, xi); % Avaliar o polinômio ajustado nos pontos xi

% Método da bissecção
a = 2;
b = 3;
tol = 1e-6;
max_iter = 100;
iter = 0;

while iter < max_iter && abs(b - a) > tol
    iter = iter + 1;
    c = (a + b) / 2;
    fc = interp1(x, fx, c, 'pchip') - target_fx;
    fa = interp1(x, fx, a, 'pchip') - target_fx;

    if fc * fa < 0
        b = c;
    else
        a = c;
    end
end
yi_bisect = interp1(x, fx, c, 'pchip');

% Exibir resultados
disp('Resultado usando interpolação inversa:');
disp(c);
disp('Resultado usando bissecção:');
disp(yi_bisect);

% Plotar gráficos
figure;
plot(x, fx, 'o', xi, yi_inv, '-', c, target_fx, 'x');
legend('Dados', 'Interpolação inversa', 'Resultado');
xlabel('x');
ylabel('f(x)');
title('Interpolação inversa com polinômio interpolador cúbico');

% Calcular erros absolutos e relativos
abs_error_inv = abs(target_fx - yi_inv(end));
rel_error_inv = abs_error_inv / target_fx;
abs_error_bisect = abs(target_fx - yi_bisect);
rel_error_bisect = abs_error_bisect / target_fx;

% Exibir erros
disp('Erro absoluto e relativo usando interpolação inversa:');
disp(abs_error_inv);
disp(rel_error_inv);
disp('Erro absoluto e relativo usando bissecção:');
disp(abs_error_bisect);
disp(rel_error_bisect);