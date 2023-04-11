% Montar a matriz A
A = [10, 2, -1;
     -3, -6, 2;
     1, 1, 5];

% Criar a matriz aumentada com a matriz identidade
n = length(A);
augmented_matrix = [A, eye(n)];

% Função para aplicar o método de Gauss-Jordan sem pivoteamento
function aug_matrix = gauss_jordan_without_pivoting(aug_matrix)
  n = length(aug_matrix(:, 1));
  for k = 1:n
    % Dividir a linha pelo elemento da diagonal
    aug_matrix(k, :) = aug_matrix(k, :) / aug_matrix(k, k);

    % Zerar os elementos abaixo e acima da diagonal
    for i = [1:(k - 1), (k + 1):n]
      aug_matrix(i, :) = aug_matrix(i, :) - aug_matrix(i, k) * aug_matrix(k, :);
    end
  end
endfunction

% Aplicar o método de Gauss-Jordan sem pivoteamento
augmented_matrix = gauss_jordan_without_pivoting(augmented_matrix);

% Obter a matriz inversa de A
A_inv = augmented_matrix(:, (n + 1):(2 * n));

% Exibir a matriz inversa
disp("A matriz inversa de A é:");
disp(A_inv);

% Verificar o resultado multiplicando A por A_inv
result = A * A_inv;

% Exibir o resultado da multiplicação
disp("O resultado de [A][A]^(-1) e:");
disp(result);

% Criar uma matriz contendo os elementos absolutos de A e A_inv
bar_matrix = [abs(A(:)), abs(A_inv(:))];

% Criar um gráfico de barras
bar(bar_matrix);

% Configurar o gráfico
xlabel('Indice do elemento');
ylabel('Valor absoluto');
legend({'A', 'A^{-1}'});
title('Comparação dos elementos de A e A^{-1}');
