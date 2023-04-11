% Definir o sistema de equacoes como uma matriz aumentada A e um vetor b
A = [2 -6 -1; -3 -1 7; -8 1 -2];
b = [-38; -34; -20];

% Funcao de eliminacao de Gauss com pivoteamento parcial
function [A, b] = gauss_elimination_partial_pivoting(A, b)
  n = length(b);
  for k = 1:n-1
    [~, max_row] = max(abs(A(k:n, k)));
    max_row = max_row + k - 1;
    
    if max_row != k
      A([k, max_row], :) = A([max_row, k], :);
      b([k, max_row]) = b([max_row, k]);
    end
    
    for i = k+1:n
      m = A(i, k) / A(k, k);
      A(i, k) = 0;
      A(i, k+1:n) = A(i, k+1:n) - m * A(k, k+1:n);
      b(i) = b(i) - m * b(k);
    end
    
    % Listar informacoes úteis durante o pivoteamento
    fprintf('\nIteracao: %d\n', k);
    fprintf('Matriz A atualizada:\n');
    disp(A);
    fprintf('Vetor b atualizado:\n');
    disp(b);
  end
endfunction

tic;
[A, b] = gauss_elimination_partial_pivoting(A, b);
elapsed_time = toc;

% Funcao de substituicao reversa
function x = back_substitution(A, b)
  n = length(b);
  x = zeros(n, 1);
  
  for i = n:-1:1
    x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
  end
endfunction

x = back_substitution(A, b);

% Calcular o determinante
determinant = prod(diag(A));

% Listar informacoes finais
fprintf('\nSolucao final:\n');
disp(x);
fprintf('Determinante: %f\n', determinant);

% Verificar a solucao
residual = A * x - b;
fprintf('\nResiduos das equacoes originais:\n');
disp(residual);

% Exibir o tempo de execucao
fprintf('Tempo de execucao do processo de eliminacao de Gauss: %f segundos\n', elapsed_time);


% Graficos
figure;
plot(x, 'o-');
title('Solucao do Sistema de Equacoes');
xlabel('Variaveis');
ylabel('Valores');
grid on;

figure;
bar(diag(A));
title('Elementos da Diagonal da Matriz A');
xlabel('Indice');
ylabel('Valor');
grid on;

figure;
plot(residual, 'r*-');
title('Residuos das Equacoes Originais');
xlabel('Equacoes');
ylabel('Residuo');
grid on;
