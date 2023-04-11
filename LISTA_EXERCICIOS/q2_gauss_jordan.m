% Definir os coeficientes das equações
Q12 = 1; % Substitua pelo valor real
Q23 = 1; % Substitua pelo valor real
Q31 = 1; % Substitua pelo valor real

% Montar a matriz A e o vetor B
A = [Q12, 0, -Q31;
     Q12, -Q23, 0];
B = [0; 0];

% Funcao para aplicar o metodo de Gauss-Jordan
function A = gauss_jordan(A)
  [n, m] = size(A);
  for k = 1:n
    A(k, :) = A(k, :) / A(k, k);
    for i = 1:n
      if i != k
        A(i, :) = A(i, :) - A(i, k) * A(k, :);
      end
    end
  end
endfunction

% Medir o tempo de execucao do metodo de Gauss-Jordan
tic;
A = gauss_jordan(A);
elapsed_time = toc;

% Exibir a matriz A apos a aplicacao do metodo de Gauss-Jordan
disp('Matriz A apos a aplicacao do metodo de Gauss-Jordan:');
disp(A);

% Exibir o tempo de execucao
fprintf('Tempo de execucao do metodo de Gauss-Jordan: %f segundos\n', elapsed_time);
