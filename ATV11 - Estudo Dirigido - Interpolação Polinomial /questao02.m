% Dados fornecidos
x = [1, 2, 3, 5, 6];
fx = [7, 4, 5.5, 40, 82];

% Ponto de interesse
xi = 4;

% Função para calcular os coeficientes do polinômio interpolador de Newton
function coef = newton_coeffs(x, fx)
    n = length(x);
    coef = zeros(1, n);
    coef(1) = fx(1);

    for i = 2:n
        coef(i) = (fx(i) - fx(i-1)) / (x(i) - x(i-1));
        for j = i-1:-1:1
            coef(i) = coef(i) / (x(i) - x(j));
        end
    end
end

% Função para avaliar o polinômio interpolador de Newton
function value = newton_eval(x, coef, xi)
    n = length(x);
    value = coef(n);

    for i = n-1:-1:1
        value = value * (xi - x(i)) + coef(i);
    end
end

% Calcular os coeficientes do polinômio interpolador de Newton
coef = newton_coeffs(x, fx);

% Resultados usando polinômios interpoladores de Newton de 1º a 4º graus
newton_results = [];
for i = 1:4
    newton_results(i) = newton_eval(x(1:i+1), coef(1:i+1), xi);
end

% Função para avaliar o polinômio interpolador de Lagrange
function value = lagrange_eval(x, fx, xi)
    n = length(x);
    value = 0;
    
    for i = 1:n
        L = 1;
        for j = 1:n
            if i ~= j
                L = L * (xi - x(j)) / (x(i) - x(j));
            end
        end
        value = value + fx(i) * L;
    end
end

% Resultados usando polinômios interpoladores de Lagrange de 1º a 4º graus
lagrange_results = [];
for i = 1:4
    lagrange_results(i) = lagrange_eval(x(1:i+1), fx(1:i+1), xi);
end

% Exibir resultados
disp('Resultados usando polinomios interpoladores de Newton:');
disp(newton_results);
disp('Resultados usando polinomios interpoladores de Lagrange:');
disp(lagrange_results);

% Calcular erros absolutos e relativos
newton_abs_errors = abs(newton_results - newton_results(4));
newton_rel_errors = newton_abs_errors / newton_results(4);

lagrange_abs_errors = abs(lagrange_results - lagrange_results(4));
lagrange_rel_errors = lagrange_abs_errors / lagrange_results(4);

% Plotar erros absolutos e relativos
figure;
subplot(2, 1, 1);
plot(1:4, newton_abs_errors, '-o', 1:4, lagrange_abs_errors, '-x');
legend('Newton', 'Lagrange');
xlabel('Grau do polinomio');
ylabel('Erro absoluto');
title('Erros absolutos para polinomios interpoladores de Newton e Lagrange');

subplot(2, 1, 2);
plot(1:4, newton_rel_errors, '-o', 1:4, lagrange_rel_errors, '-x');
legend('Newton', 'Lagrange');
xlabel('Grau do polinomio');
ylabel('Erro relativo');
title('Erros relativos para polinomios interpoladores de Newton e Lagrange');

