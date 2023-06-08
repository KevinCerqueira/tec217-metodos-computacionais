% Sistema de equações
i = [1 0 0;0 1 0;0 0 1];
A = [-0.04 0.04 0.12; 0.56 -1.56 0.32; -0.24 1.24 -0.28];
b = [3; 1; 0];
n = length(b);
fprintf("Valores iniciais:\n");
disp(Ab)
fprintf("Eliminação de Gauss-Jordan:\n\n");
% Matriz aumentada
Ab = [A eye(n) b];

% Eliminação de Gauss
for k = 1:n-1
  for i = k+1:n
    m = Ab(i,k) / Ab(k,k);
    Ab(i,k:n*2+1) = Ab(i,k:n*2+1) - m*Ab(k,k:n*2+1);
    disp("Matriz aumentada após eliminação de Gauss:\n");
    disp(Ab);
  end
end

% Eliminação de Gauss-Jordan
for k = 1:n
  Ab(k,:) = Ab(k,:) / Ab(k,k);
  disp("Matriz aumentada após normalização:\n");
  disp(Ab);
  for i = [1:k-1 k+1:n]
    Ab(i,:) = Ab(i,:) - Ab(i,k)*Ab(k,:);
    disp("Matriz aumentada após eliminação de Gauss-Jordan:\n");
    disp(Ab);
  end
end

% Matriz inversa
inv_A = Ab(:, n+2:end);
disp("A inversa é:\n");
disp(inv_A);

% Matriz identidade
I = Ab(:, n+1:n*2);
disp("A matriz identidade é:\n");
disp(I);
