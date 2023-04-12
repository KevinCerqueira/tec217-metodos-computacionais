% Matriz A e vetor b fornecidos
A = [4, -1, -1, 0;
     -1, 4, 0, -1;
     -1, 0, 4, -1;
     0, -1, -1, 4];
     
b = [175; 100; 75; 0];

tol = 1e-2;
max_iter = 1000;

function x = gauss_seidel(A, b, tol, max_iter)
    n = length(A);
    x = zeros(n, 1);
    x_prev = x;

    for k = 1:max_iter
        for i = 1:n
            x(i) = (b(i) - A(i, [1:(i-1), (i+1):n]) * x([1:(i-1), (i+1):n])) / A(i, i);
        end
        
        % Imprime o vetor x após cada iteração
        fprintf('Iteracao k = %d\n', k);
        disp('Vetor x:');
        disp(x);
        
        % Verifica a convergência usando o erro percentual relativo
        relative_error = abs((x - x_prev) ./ x) * 100;
        if max(relative_error) < tol
            break;
        end
        x_prev = x;
    end
end

fprintf("\n\nMetodo de Gauss-Seidel:\n");
% Resolve o sistema de equações usando o método de Gauss-Seidel
tic;
x = gauss_seidel(A, b, tol, max_iter);
toc;

% Exibe o resultado
disp(x);
