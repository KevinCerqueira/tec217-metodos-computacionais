% Matriz A e vetor b fornecidos
A = [4, -1, -1, 0;
     -1, 4, 0, -1;
     -1, 0, 4, -1;
     0, -1, -1, 4];
     
b = [175; 100; 75; 0];

tol = 1e-2;
max_iter = 1000;
w = 1.5; % Fator de relaxamento (1 < w < 2 para convergência)

function x = sor(A, b, tol, max_iter, w)
    n = length(A);
    x = zeros(n, 1);
    x_prev = x;

    for k = 1:max_iter
        for i = 1:n
            x(i) = ((1 - w) * x_prev(i)) + (w * (b(i) - A(i, [1:(i-1), (i+1):n]) * x([1:(i-1), (i+1):n])) / A(i, i));
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

fprintf("\n\nMetodo de SOR:\n");
% Resolve o sistema de equações usando o método SOR
tic;
x = sor(A, b, tol, max_iter, w);
toc;

% Exibe o resultado
disp(x);
