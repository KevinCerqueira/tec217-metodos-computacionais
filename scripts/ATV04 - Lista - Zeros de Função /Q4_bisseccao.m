% Parâmetros do método
x0 = 0.5; % chute inicial 1
x1 = 1.5; % chute inicial 2
tol = 1e-6; % tolerância
maxiter = 100; % número máximo de iterações

% Implementação do método da secante
for i = 1:maxiter
  fx0 = volume(x0);
  fx1 = volume(x1);
  x2 = x1 - fx1*(x1 - x0)/(fx1 - fx0);
  if abs(x2 - x1) < tol
    break;
  endif
  x0 = x1;
  x1 = x2;
endfor

% Saída do resultado
if i == maxiter
  disp("O método não convergiu!");
else
  printf("A altura é: %.6f m\n", x2);
endif
