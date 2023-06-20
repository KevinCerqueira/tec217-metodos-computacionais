A = 8500;
P = 35000;
m = 7;
a = 0.001;
b = 0.3;
tol = 0.00005;

[r, iter] = bissecao(A, P, m, a, b, tol);

printf("Taxa de juros: %.2f por cento\n", r);
printf("Número de iterações: %d\n", iter);
