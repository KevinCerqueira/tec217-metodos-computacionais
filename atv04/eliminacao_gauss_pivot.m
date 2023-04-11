function x = eliminacao_gauss_pivot(A, b)
  n = size(A, 1);
  
  % Eliminação Gaussiana com pivoteamento
  %fprintf("Valores iniciais:\n");
  %fprintf("Matrix A:\n");
  %disp(A);
  %fprintf("Vetor b:\n");
  %disp(b);
  %fprintf("\n---------------------------\n\n");
  fprintf("COM PIVOTEAMENTO:\n");
  for k = 1:n-1
    [max_val, max_idx] = max(abs(A(k:n,k)));
    max_idx = max_idx + k - 1;
    
    if max_val == 0
      error("A Matriz Singular!");
    end
    
    if max_idx ~= k
      A([k max_idx],k:n) = A([max_idx k],k:n);
      b([k max_idx]) = b([max_idx k]);
    end
    
    for i = k+1:n
      fator = A(i,k)/A(k,k);
      A(i,k+1:n) = A(i,k+1:n) - fator*A(k,k+1:n);
      b(i) = b(i) - fator*b(k);
      fprintf("Após o pivoteamento: k:%d, i:%d\n",k, i);
      fprintf("Matrix A:\n");
      disp(A);
      fprintf("Vetor b:\n");
      disp(b);
      fprintf("\n---------------------------\n\n");
    end
  end
  
  % Retrosubstituição
  x = zeros(n,1);
  x(n) = b(n)/A(n,n);
  for i = n-1:-1:1
    x(i) = (b(i) - A(i,i+1:n)*x(i+1:n))/A(i,i);
  end
end
