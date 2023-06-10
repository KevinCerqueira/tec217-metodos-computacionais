% Define a função f(x) como uma função anônima
f = @(x) x^3 - 9*x + 3;

% Define o intervalo inicial [a, b]
a = 0;
b = 1;

% Define a tolerância
e = 5e-4;

% Define as listas para armazenar os valores de cada iteração
iteracoes = [];
limite_inferior = [];
limite_superior = [];
raiz_aproximada = [];
f_raiz_aproximada = [];
erro_aproximado = [];
erro_verdadeiro = [];

% Loop para aplicar o método da falsa posição
while abs(b - a) > e
  % Calcula o ponto c da reta secante que intercepta o eixo x
  c = (a*f(b) - b*f(a)) / (f(b) - f(a));
  % Calcula o valor de f(c)
  f_c = f(c);

  % Armazena os valores de cada iteração nas respectivas listas
  iteracoes(end+1) = length(iteracoes)+1;
  limite_inferior(end+1) = a;
  limite_superior(end+1) = b;
  raiz_aproximada(end+1) = c;
  f_raiz_aproximada(end+1) = f_c;
  erro_aproximado(end+1) = abs((b-a)/2);
  erro_verdadeiro(end+1) = abs(c - (3/(sqrt(3)+1)^2));

  % Verifica o sinal de f(c) e atualiza o intervalo [a, b]
  if f_c > 0
      b = c;
  elseif f_c < 0
      a = c;
  else
      break
  end
end

% Exibe os resultados de cada iteração
fprintf("%5s %18s %18s %18s %18s %18s %18s\n", "It", "Limite Inferior", "Limite Superior", "Raiz Aproximada", "f(Raiz Aproximada)", "Erro Aproximado", "Erro Verdadeiro");
for i = 1:length(iteracoes)
fprintf("%5d %18.10f %18.10f %18.10f %18.10f %18.10f %18.10f\n", iteracoes(i), limite_inferior(i), limite_superior(i), raiz_aproximada(i), f_raiz_aproximada(i), erro_aproximado(i), erro_verdadeiro(i));
end

% Plota o erro aproximado e o erro verdadeiro
figure();
plot(iteracoes, erro_aproximado, "b-", iteracoes, erro_verdadeiro, "r-");
xlabel("Iterações");
ylabel("Erro");
legend("Erro Aproximado", "Erro Verdadeiro");
grid on;
