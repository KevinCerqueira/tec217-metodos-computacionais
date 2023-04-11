% Montar a matriz A e o vetor B
A = [0.52, 0.20, 0.25;
     0.30, 0.50, 0.20;
     0.18, 0.30, 0.55];
B = [4800; 5800; 5700];

% Função para aplicar a eliminação de Gauss sem pivoteamento
function [A, B] = gauss_elimination(A, B)
  n = length(B);
  for k = 1:(n - 1)
    for i = (k + 1):n
      factor = A(i, k) / A(k, k);
      A(i, k:n) = A(i, k:n) - factor * A(k, k:n);
      B(i) = B(i) - factor * B(k);
    end
  end
endfunction

% Resolver o sistema usando a eliminação de Gauss sem pivoteamento
[A, B] = gauss_elimination(A, B);

% Realizar a substituição reversa
X = zeros(3, 1);
for i = 3:-1:1
  X(i) = (B(i) - A(i, (i + 1):3) * X((i + 1):3)) / A(i, i);
end

% Exibir os resultados
fprintf('Volume a ser extraido da Mina 1: %f m3\n', X(1));
fprintf('Volume a ser extraido da Mina 2: %f m3\n', X(2));
fprintf('Volume a ser extraido da Mina 3: %f m3\n', X(3));
