function [x, det] = gauss_pivot(A, b)
    n = size(A, 1);
    det = 1;
    for k = 1:n-1
        % pivoteamento parcial
        [m, i] = max(abs(A(k:n, k)));
        i = i + k - 1;
        if i ~= k
            A([k i], :) = A([i k], :);
            b([k i]) = b([i k]);
            det = -det;
        end
        % eliminação gaussiana
        for j = k+1:n
            m = A(j,k) / A(k,k);
            A(j,k+1:n) = A(j,k+1:n) - m * A(k,k+1:n);
            A(j,k) = m;
        end
        det = det * A(k,k);
    end
    det = det * A(n,n);
    % resolução do sistema triangular superior
    x = zeros(n, 1);
    x(n) = b(n) / A(n,n);
    for k = n-1:-1:1
        x(k) = (b(k) - A(k,k+1:n) * x(k+1:n)) / A(k,k);
    end
end

