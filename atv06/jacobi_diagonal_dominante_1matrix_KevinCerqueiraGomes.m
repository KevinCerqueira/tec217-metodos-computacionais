% Definição dos dados do problema
A = [5 1 1; 3 4 1; 3 3 6];
b = [5; 6; 0];
x0 = [0; 0; 0];
tol = 0.05;
fprintf("Utilizando matrix da questão 1!\n");
 Verificação do critério de convergência
if abs(A(1,1)) <= abs(A(1,2)) + abs(A(1,3)) || abs(A(2,2)) <= abs(A(2,1)) + abs(A(2,3)) || abs(A(3,3)) <= abs(A(3,1)) + abs(A(3,2))
  fprintf("A matriz não é diagonal estritamente dominante por linhas!")
end

% Aplicação do método de Jacobi
x = x0;
err = tol + 1;
itr = 0;
while err > tol
  x_ant = x;
  x(1) = (b(1) - A(1,2)*x_ant(2) - A(1,3)*x_ant(3)) / A(1,1);
  x(2) = (b(2) - A(2,1)*x_ant(1) - A(2,3)*x_ant(3)) / A(2,2);
  x(3) = (b(3) - A(3,1)*x_ant(1) - A(3,2)*x_ant(2)) / A(3,3);
  itr = itr + 1;
  err = max(abs((x - x_ant) ./ x));
end

% Impressão dos resultados
if itr > 1000
  disp("O método não converge para a tolerância especificada!")
else
  disp("\nValor das variáveis do sistema:")
  disp(x)
  fprintf("Iterações: %d\n", itr)
  fprintf("Erro relativo: %e\n", err)
end
