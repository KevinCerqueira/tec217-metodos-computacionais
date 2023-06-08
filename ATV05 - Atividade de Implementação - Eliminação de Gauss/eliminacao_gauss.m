% Função de Eliminação Gaussiana com Substituição Regressiva
function x = eliminacao_gauss(A, b)
   fprintf("SEM PIVOTEAMENTO:\n");
  n = size(A, 1);
  for k = 1:n-1
    for i = k+1:n
      fator = A(i,k)/A(k,k);
      for j = k:n
        A(i,j) = A(i,j) - fator*A(k,j);
      end
      b(i) = b(i) - fator*b(k);
          fprintf("Movimento: k:%d, i:%d\n",k, i);
      fprintf("Matrix A:\n");
      disp(A);
      fprintf("Vetor b:\n");
      disp(b);
      fprintf("\n---------------------------\n\n");
    end
  end
  
  x = zeros(n,1);
  x(n) = b(n)/A(n,n);
  for i = n-1:-1:1
    x(i) = (b(i) - A(i,i+1:n)*x(i+1:n))/A(i,i);
  end

 end