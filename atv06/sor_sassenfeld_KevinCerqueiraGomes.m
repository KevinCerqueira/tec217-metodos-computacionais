% Definir a matriz A e o vetor b do sistema
A = [1 -1; 10 -2];
b = [9; 8];

% Definir o valor inicial de x, o parâmetro de relaxamento w e o critério de parada Es
x = [0; 0];
w = 1.2;
Es = 0.1;  % 10% de erro relativo na solução

% Definir o número máximo de iterações e inicializar as variáveis de controle
max_iterations = 1000;
n_iterations = 0;
error = inf;

% Implementar o loop do método SOR
while error > Es
    x_old = x;
    for i = 1:length(b)
        s = A(i,1:i-1)*x(1:i-1) + A(i,i+1:end)*x_old(i+1:end);
        x(i) = (1-w)*x_old(i) + (w/A(i,i))*(b(i) - s);
    end
    n_iterations = n_iterations + 1;
    error = norm(x - x_old)/norm(x);
    if n_iterations >= max_iterations
        error("O método não convergiu em %d iterações.", max_iterations);
    end
end

% Imprimir os resultados
disp("\nValor das variáveis do sistema:")
disp(x)
fprintf("Iterações: %d\n", n_iterations)
fprintf("Erro relativo: %e\n", err)

