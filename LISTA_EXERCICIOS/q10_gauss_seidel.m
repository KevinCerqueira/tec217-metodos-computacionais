% Mudar renderizador gráfico
graphics_toolkit('gnuplot')

% Definir a matriz A, o vetor b, e os parâmetros
A = [2, -6, -1; -3, -1, 7; -8, 1, 2];
b = [-38; -34; -20];
Es = 0.05; % 5% de tolerância
w = 1.2;
max_iterations = 1000;

% Inicializar variáveis
n = length(b);
x = zeros(n, 1);
x_old = x;
iteration = 0;
errors_relative = [];
errors_absolute = [];
std_devs = [];

% Verificar se o sistema converge
D = diag(diag(A));
L = tril(A, -1);
U = triu(A, 1);
M = D + w * L;
N = (1 - w) * D - w * U;

if max(abs(eig(inv(M) * N))) >= 1
  disp('O sistema não converge com os parâmetros escolhidos.');
else
  % Método Gauss-Seidel com relaxamento
  while iteration < max_iterations
    iteration += 1;
    x = M \ (N * x + w * b);
    
    % Calcular e armazenar erros e desvio padrão
    relative_error = abs((x - x_old) ./ x) * 100;
    absolute_error = abs(x - x_old);
    errors_relative = [errors_relative, max(relative_error)];
    errors_absolute = [errors_absolute, max(absolute_error)];
    std_devs = [std_devs, std(absolute_error)];
    
    % Verificar critério de parada
    if max(relative_error) < Es
      break;
    end
    x_old = x;
  end

  % Imprimir os resultados finais no terminal
  disp('Resultados finais:');
  disp(x);

  % Gerar gráficos de convergência
  figure;
  subplot(3, 1, 1);
  plot(errors_relative, 'o-');
  xlabel('Iterações');
  ylabel('Erro Relativo Percentual');
  title('Convergência (Erro Relativo)');
  grid on;

  subplot(3, 1, 2);
  plot(errors_absolute, 'o-');
  xlabel('Iterações');
  ylabel('Erro Absoluto');
  title('Convergência (Erro Absoluto)');
  grid on;

  subplot(3, 1, 3);
  plot(std_devs, 'o-');
  xlabel('Iterações');
  ylabel('Desvio Padrão');
  title('Convergência (Desvio Padrão)');
  grid on;
end
