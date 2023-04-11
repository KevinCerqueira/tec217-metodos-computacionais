A = [4, -1, -1, 0;
     -1, 4, 0, -1;
     -1, 0, 4, -1;
     0, -1, -1, 4];
     
b = [175; 100; 75; 0];
fprintf("\n\nMetodo de Eliminacao de Gauss:\n");
tic;
x = gauss_elimination(A, b)
toc;

function x = gauss_elimination(A, b)
    n = length(b);
    I = eye(n); % Cria a matriz identidade

    % Pivoteamento parcial
    for k = 1:n
        % Encontra o índice da linha com o maior valor absoluto na coluna k
        [~, max_index] = max(abs(A(k:n, k)));
        max_index = max_index + k - 1;

        % Verifica se o pivoteamento ocorreu
        if max_index ~= k
            % Troca as linhas correspondentes na matriz A
            A([k, max_index], :) = A([max_index, k], :);
            % Troca as linhas correspondentes na matriz b
            b([k, max_index]) = b([max_index, k]);
            % Troca as linhas correspondentes na matriz I
            I([k, max_index], :) = I([max_index, k], :);
        end

        for i = (k+1):n
            factor = A(i, k) / A(k, k);
            A(i, k:n) = A(i, k:n) - factor * A(k, k:n);
            b(i) = b(i) - factor * b(k);
            I(i, :) = I(i, :) - factor * I(k, :); % Atualiza a matriz I
        end

        % Imprime a matriz A e a matriz I após cada iteracao
        fprintf('Iteracao k = %d\n', k);
        disp('Matriz A:');
        disp(A);
        disp('Matriz I:');
        disp(I);
    end

    % Substituicao reversa
    x = zeros(n, 1);
    x(n) = b(n) / A(n, n);

    for i = (n-1):-1:1
        x(i) = (b(i) - A(i, (i+1):n) * x((i+1):n)) / A(i, i);
    end
end
