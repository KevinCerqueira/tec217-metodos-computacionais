x = [0, 0.5, 1];
y = [1.3, 2.5, 0.9];
x_val = 0.8;

function P = lagrange_interpolation(x, y, x_val)
  n = length(x);
  P = 0;

  for i = 1:n
    L = 1;
    for j = 1:n
      if i ~= j
        L = L * (x_val - x(j)) / (x(i) - x(j));
      end
    end
    P = P + y(i) * L;
  end
end


P2_08 = lagrange_interpolation(x, y, x_val)

function L = lagrange_basis(x, i, x_val)
  n = length(x);
  L = 1;
  for j = 1:n
    if i ~= j
      L = L * (x_val - x(j)) / (x(i) - x(j));
    end
  end
end

x_plot = linspace(0, 1, 100); % Cria um vetor de 100 pontos entre 0 e 1

% Calcula os valores de Li(x) e P2(x) nos pontos x_plot
L0_plot = arrayfun(@(x_val) lagrange_basis(x, 1, x_val), x_plot);
L1_plot = arrayfun(@(x_val) lagrange_basis(x, 2, x_val), x_plot);
L2_plot = arrayfun(@(x_val) lagrange_basis(x, 3, x_val), x_plot);
P2_plot = arrayfun(@(x_val) lagrange_interpolation(x, y, x_val), x_plot);

% Plota os gráficos dos polinômios Li(x) e P2(x)
figure;
plot(x_plot, L0_plot, '-', x_plot, L1_plot, '--', x_plot, L2_plot, '-.', x_plot, P2_plot, ':', x, y, 'o');
xlabel('x');
ylabel('y');
title('Polinomios de Lagrange e Polinomio interpolador P2(x)');
legend('L0(x)', 'L1(x)', 'L2(x)', 'P2(x)', 'Pontos originais');
grid on;
