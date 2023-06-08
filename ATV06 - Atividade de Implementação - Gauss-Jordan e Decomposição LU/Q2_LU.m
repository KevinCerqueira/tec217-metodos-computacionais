% Definindo a matriz A
A = [2 1 -3; -1 3 2; 3 1 -3];

% Inicializando as matrizes L e U
n = size(A, 1);
L = eye(n);
U = zeros(n);

% Decomposição LU
for k = 1:n
    U(k,k) = A(k,k) - L(k,1:k-1)*U(1:k-1,k);
    for i = k+1:n
        L(i,k) = (A(i,k) - L(i,1:k-1)*U(1:k-1,k))/U(k,k);
        U(k,i) = A(k,i) - L(k,1:k-1)*U(1:k-1,i);
    end
end

% Mostrando a matriz L
disp("Matriz L:");
disp(L);

% Mostrando a matriz U
disp("Matriz U:");
disp(U);

% Resolvendo o sistema linear
b = [2; 0; 1];
y = zeros(n,1);
x = zeros(n,1);

% Resolvendo Ly = b
for i = 1:n
    y(i) = b(i) - L(i,1:i-1)*y(1:i-1);
end

% Resolvendo Ux = y
for i = n:-1:1
    x(i) = (y(i) - U(i,i+1:n)*x(i+1:n))/U(i,i);
end

% Mostrando a solução do sistema
disp("Vetor solução x:");
disp(x);
