A = [4, -1, -1, 0;
     -1, 4, 0, -1;
     -1, 0, 4, -1;
     0, -1, -1, 4];
     
b = [175; 100; 75; 0];
fprintf("\n\nMetodo de Gauss Jordan:\n");
tic;
x = gauss_jordan(A, b)
toc;

function x = gauss_jordan(A, b)
    n = length(b);
    I = eye(n); % Cria a matriz identidade

    % Pivoteamento parcial e eliminação
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

        % Eliminação
        for i = 1:n
            if i ~= k
                factor = A(i, k) / A(k, k);
                A(i, k:n) = A(i, k:n) - factor * A(k, k:n);
                b(i) = b(i) - factor * b(k);
                I(i, :) = I(i, :) - factor * I(k, :); % Atualiza a matriz I
            end
        end

        % Imprime a matriz A e a matriz I após cada iteração
        fprintf('Iteracao k = %d\n', k);
        disp('Matriz A:');
        disp(A);
        disp('Matriz I:');
        disp(I);
    end

    % Normaliza a matriz A para obter a matriz identidade
    for i = 1:n
        b(i) = b(i) / A(i, i);
        A(i, :) = A(i, :) / A(i, i);
    end

    x = b; % A matriz b agora contém a solução
end
