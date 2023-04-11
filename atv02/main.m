f = @(x) exp(-x);
X0 = 1;
tol = 1e-5;
max_iter = 100;

[Xr, iter] = metodo_iteracao_linear(f, X0, tol, max_iter);

fprintf("Raiz aproximada: %.6f\n", Xr);
fprintf("Número de iterações: %d\n", iter);
