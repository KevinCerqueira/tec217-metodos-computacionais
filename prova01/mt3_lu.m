% Matriz A e vetor b fornecidos
A = [4, -1, -1, 0;
     -1, 4, 0, -1;
     -1, 0, 4, -1;
     0, -1, -1, 4];
     
b = [175; 100; 75; 0];

function [L, U] = lu_decomposition(A)
    n = length(A);
    L = eye(n);
    U = zeros(n);

    for k = 1:n
        U(k, k:n) = A(k, k:n) - L(k, 1:(k-1)) * U(1:(k-1), k:n);
        if k < n
            L((k+1):n, k) = (A((k+1):n, k) - L((k+1):n, 1:(k-1)) * U(1:(k-1), k)) / U(k, k);
        end
        
        % Imprime a matriz L e a matriz U após cada iteracao
        fprintf('Iteracao k = %d\n', k);
        disp('Matriz L:');
        disp(L);
        disp('Matriz U:');
        disp(U);
    end
end

function x = lu_solve(L, U, b)
    n = length(b);

    % Substituicao progressiva
    y = zeros(n, 1);
    y(1) = b(1);
    for i = 2:n
        y(i) = b(i) - L(i, 1:(i-1)) * y(1:(i-1));
        
        % Imprime o vetor y após cada iteracao
        fprintf('Substituicao progressiva - Iteracao i = %d\n', i);
        disp('Vetor y:');
        disp(y);
    end

    % Substituicao regressiva
    x = zeros(n, 1);
    x(n) = y(n) / U(n, n);
    for i = (n-1):-1:1
        x(i) = (y(i) - U(i, (i+1):n) * x((i+1):n)) / U(i, i);
        
        % Imprime o vetor x após cada iteracao
        fprintf('Substituicao regressiva - Iteracao i = %d\n', i);
        disp('Vetor x:');
        disp(x);
    end
end

% Resolve o sistema de equações usando decomposicao LU
tic;
[L, U] = lu_decomposition(A);
fprintf("\n\nMetodo de Decomposicao LU:\n");
x = lu_solve(L, U, b);
toc;
