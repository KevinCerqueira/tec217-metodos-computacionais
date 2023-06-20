x = [0, 1, 2, 3, 4, 5];
fx = [0, 0.5, 0.8, 0.9, 0.941176, 0.961538];
target_fx = 0.85;

function L = lagrange(x, y, target)
    n = length(x);
    L = 0;
    for j = 1:n
        term = y(j);
        for m = 1:n
            if m ~= j
                term = term * (target - x(m)) / (x(j) - x(m));
            end
        end
        L = L + term;
    end
end

interpolated_x = lagrange(fx, x, target_fx);
disp('Valor de x interpolado:');
disp(interpolated_x);

func = @(x) x^2 / (1 + x^2) - target_fx;
analytical_x = fzero(func, [0, 5]);
disp('Valor de x analítico (aproximado):');
disp(analytical_x);

figure;
plot(x, fx, 'o', 'MarkerSize', 10, 'LineWidth', 1.5);
hold on;
f = @(x) x.^2 ./ (1 + x.^2);
x_range = linspace(0, 5, 100);
plot(x_range, f(x_range), 'LineWidth', 1.5);
plot(interpolated_x, target_fx, 'x', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Interpolação Inversa');
legend('Pontos de Dados', 'Função f(x)', 'Valor Interpolado');
