A = [1 0.5 0.1; 0.2 1 -0.2; 0.1 -0.2 1];
b = [0.2; -2; 1];
x0 = [0; 0; 0];
tol = 1e-6;
maxitr = 100;

[x, itr, Erx, msg] = gauss_seidel(A, b, x0, tol, maxitr);

% Impressão dos resultados
if itr > 1000
  disp("O método não converge para a tolerância especificada!")
else
  disp("Valor das variáveis do sistema:")
  disp(x)
  fprintf("\nIterações: %d\n", itr)
  fprintf("Erro relativo: %e\n", Erx)
end
