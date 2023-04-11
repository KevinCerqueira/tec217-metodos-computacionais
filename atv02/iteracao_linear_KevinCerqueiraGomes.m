# Definição da função f(x) e da função de iteração g(x)
f = @(x) exp(-x) - x;
g = @(x) exp(-x);

# Definição dos valores iniciais
X0 = 0;
sigma = 1e-4;
N = 1000;
r = 0.56714329;

# Inicialização das variáveis
Xr = X0;
erro_aprox = Inf;
n = 0;

# Impressão do cabeçalho da tabela
fprintf(' n     Xr         f(Xr)         erro_aprox   erro_verd\n');

# Laço de iteração
while erro_aprox > sigma && n < N
  Xr_anterior = Xr;
  Xr = g(Xr_anterior);
  
  # Cálculo dos erros
  erro_aprox = abs(Xr - Xr_anterior);
  erro_verd = abs(Xr - r);
  
  # Impressão dos valores de cada iteração
  fprintf('%2d  %.8f  %.8f  %.8f  %.8f\n', n, Xr, f(Xr), erro_aprox, erro_verd);
  
  n = n + 1;
end

# Verificação do número de iterações
if n == N
  fprintf('O método atingiu o número máximo de iterações sem convergir para a raiz.\n');
else
  fprintf('A raiz aproximada é %.8f, com erro aproximado de %.8f e erro verdadeiro de %.8f.\n', Xr, erro_aprox, erro_verd);
end