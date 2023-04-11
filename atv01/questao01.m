% Define a função f(x) como uma função anônima
f = @(x) (x/2)^2 - sin(x);

% Solicita ao usuário os valores de a e b
a = input("Digite o valor de A: ");
b = input("Digite o valor de B: ");

% Define a tolerância
e = 1e-6;

% Loop para aplicar o método da bissecção até que a diferença entre b e a seja menor que a tolerância e
while (b - a) > e
  % Calcula o ponto médio c
  c = (a + b) / 2;
  % Verifica se c é uma raiz exata da função f
  if f(c) == 0
      break
  % Caso contrário, atualiza o intervalo [a, b] de acordo com o sinal de f(c)
  elseif sign(f(c)) == sign(f(a))
      a = c;
  else
      b = c;
  end
end

% Exibe a raiz aproximada da função com 10 casas decimais
fprintf("A raiz da função é aproximadamente %.10f\n", c);