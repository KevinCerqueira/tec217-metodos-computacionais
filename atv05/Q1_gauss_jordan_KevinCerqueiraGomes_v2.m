% Sistema de equações
A = [-0.04 0.04 0.12; 0.56 -1.56 0.32; -0.24 1.24 -0.28];
b = [3; 1; 0];
n = length(b);

% Matriz aumentada
Ab = [A b];

% Eliminação de Gauss
for k = 1:n-1
  for i = k+1:n
    m = Ab(i,k) / Ab(k,k);
    Ab(i,k:n+1) = Ab(i,k:n+1) - m*Ab(k,k:n+1);
    fprintf("--------------------------------------------\n");
    disp(Ab)
  end
end

% Eliminação de Gauss-Jordan
for k = 1:n
  Ab(k,:) = Ab(k,:) / Ab(k,k);
  fprintf("-----------------------------------------------\n");
  disp(Ab)
  for i = [1:k-1 k+1:n]
    Ab(i,:) = Ab(i,:) - Ab(i,k)*Ab(k,:);
    fprintf("----------------------------------------------\n");
    disp(Ab)
  end
end

% Matriz inversa
inv_A = Ab(:, n+1:end);
disp("A inversa é:");
disp(inv_A);
