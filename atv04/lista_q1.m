A = [2 -6 -1; -3 -1 7; -8 1 -2];
b = [-38 -34 -20];

n_values = 10:10:100;
iter_values = [];
for n = n_values
    A = rand(n) * 20 - 10;
    b = rand(n, 1) * 20 - 10;
    tic;
    [x, det] = gauss_pivot(A, b);
    iter_values(end+1) = toc;
end
plot(n_values, iter_values, '-o');
xlabel('Tamanho da matriz (n)');
ylabel('Tempo de execução (s)');
