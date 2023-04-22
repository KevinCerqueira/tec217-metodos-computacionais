x = [0, 0.5, 1];
y = [1, 2.12, 3.55];
x_val = 0.7;

function P = newton_interpolation(x, y, x_val)
  n = length(x);
  diff_div = zeros(n, n);
  diff_div(:, 1) = y;

  for j = 2:n
    for i = 1:(n - j + 1)
      diff_div(i, j) = (diff_div(i + 1, j - 1) - diff_div(i, j - 1)) / (x(i + j - 1) - x(i));
    end
  end

  P = diff_div(1, 1);
  term = 1;

  for j = 1:(n - 1)
    term = term * (x_val - x(j));
    P = P + diff_div(1, j + 1) * term;
  end
end

P2_07 = newton_interpolation(x, y, x_val)

x_plot = linspace(0, 1, 100); % Cria um vetor de 100 pontos entre 0 e 1
y_plot = arrayfun(@(x_val) newton_interpolation(x, y, x_val), x_plot); % Avalia P2(x) para cada x no vetor x_plot

figure; % Cria uma nova janela de figura
plot(x, y, 'o', x_plot, y_plot, '-'); % Plota os pontos originais e o polinômio interpolador
xlabel('x');
ylabel('P2(x)');
title('Polinomio interpolador de grau 2 P2(x)');
legend('Pontos originais', 'P2(x)');
grid on;
