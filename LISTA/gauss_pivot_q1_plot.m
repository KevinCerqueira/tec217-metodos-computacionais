A = [1 -2 1; 2 -5 3; -1 3 -4];
b = [0; -1; 2];
n = length(A);
det_values = zeros(n, 1);
det_values(1) = prod(diag(A));
for k = 1:n-1
    [max_val, max_row] = max(abs(A(k:n,k)));
    max_row = max_row + k - 1;
    if max_val == 0
        error("Matriz singular.");
    end
    if max_row != k
        A([k max_row], k:n) = A([max_row k], k:n);
        b([k max_row]) = b([max_row k]);
        det_values(k+1) = -det_values(k);
    else
        det_values(k+1) = det_values(k);
    end
    for i = k+1:n
        m = A(i,k) / A(k,k);
        A(i,k:n) = A(i,k:n) - m * A(k,k:n);
        b(i) = b(i) - m * b(k);
    end
    det_values(k+1) = det_values(k+1) * A(k+1,k+1);
end
det_values(n+1) = prod(diag(A));
plot(0:n, det_values, '-o');
xlabel('Número de operações elementares');
ylabel('Determinante');
