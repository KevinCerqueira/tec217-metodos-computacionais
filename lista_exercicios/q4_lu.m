% Montar a matriz A e o vetor B
A = [7, 2, -3;
     2, 5, -3;
     1, 1, -6];
B = [-12; -20; -26];

% Função para realizar a decomposição LU
function [L, U] = lu_decomposition(A)
  n = length(A);
  L = eye(n);
  U = A;
  for k = 1:(n - 1)
    for i = (k + 1):n
      L(i, k) = U(i, k) / U(k, k);
      U(i, k:n) = U(i, k:n) - L(i, k) * U(k, k:n);
    end
  end
endfunction

% Decompor a matriz A em L e U
[L, U] = lu_decomposition(A);

% Resolver o sistema Ly = b usando a substituição progressiva
y = zeros(3, 1);
for i = 1:3
  y(i) = B(i) - L(i, 1:(i - 1)) * y(1:(i - 1));
end

% Resolver o sistema Ux = y usando a substituição regressiva
X = zeros(3, 1);
for i = 3:-1:1
  X(i) = (y(i) - U(i, (i + 1):3) * X((i + 1):3)) / U(i, i);
end

% Exibir os resultados
fprintf('x1 = %f\n', X(1));
fprintf('x2 = %f\n', X(2));
fprintf('x3 = %f\n', X(3));
