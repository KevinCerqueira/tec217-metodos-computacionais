% Montar a matriz A
A = [8, 2, -10;
     -9, 1, 3;
     15, -1, 6];

% Normalizar a matriz A
[n_rows, n_cols] = size(A);
normalized_A = zeros(n_rows, n_cols);

% Iterar pelas linhas e normalizar cada uma
for i = 1:n_rows
  max_val = max(abs(A(i, :)));
  normalized_A(i, :) = A(i, :) / max_val;
  disp(['Iteracao ', num2str(i), ':']);
  disp(normalized_A);
end

% Calcular a norma ||A||₁ (norma 1)
norm_1 = max(sum(abs(normalized_A), 1));
disp(['||A||1 = ', num2str(norm_1)]);

% Calcular a norma ||A||∞ (norma infinito)
norm_inf = max(sum(abs(normalized_A), 2));
disp(['||A||2 = ', num2str(norm_inf)]);
