i = [0.25, 0.75, 1.25, 1.5, 2.0];
V = [-0.45, -0.6, 0.7, 1.88, 6.0];
target_i = 1.15;

function L = lagrange(x, y, degree)
    n = length(x);
    L = 0;
    for j = 1:degree+1
        term = y(j);
        for m = 1:degree+1
            if m ~= j
                term = term * (x(m) - x(j)) / (x(m) - x(j));
            end
        end
        L = L + term;
    end
end

errors = zeros(4, 1);
estimations = zeros(4, 1);

for degree = 1:4
    estimation = lagrange(i, V, degree);
    estimations(degree) = estimation;
    errors(degree) = abs(estimation - V(degree+1)) / V(degree+1);
end

[min_error, best_degree] = min(errors);
best_estimation = estimations(best_degree);

disp('Erros relativos:');
disp(errors);
disp('Melhor estimativa:');
disp(best_estimation);

figure;
plot(1:4, estimations, 'o-', 'LineWidth', 1.5);
xlabel('Grau de Interpolação');
ylabel('Estimativa da queda de tensão');
title('Estimativas de interpolação para diferentes graus');

figure;
plot(1:4, errors, 'o-', 'LineWidth', 1.5);
xlabel('Grau de Interpolação');
ylabel('Erro relativo');
title('Erros relativos para diferentes graus de interpolação');

