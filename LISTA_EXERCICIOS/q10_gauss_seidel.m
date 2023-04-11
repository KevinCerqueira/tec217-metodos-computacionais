% Montar a matriz A e o vetor b
A = [2, -6, -1;
     -3, -1, 7;
     -8, 1, 2];
b = [-38; -34; -20];

% Número de variáveis
n = length(b);

% Critério de parada (erro relativo percentual)
Es = 0.05; % 5%

% Número máximo de iterações
max_iterations = 230;

% Inicializar o vetor de soluções x
x = zeros(n, 1);
x_old = x;

% Inicializar o contador de iterações e os vetores para armazenar os erros
iteration = 0;
errors_relative = [];
errors_absolute = [];
std_devs = [];

% Parâmetro de relaxamento
w = 1.2;

% Gauss-Seidel com relaxamento
while iteration < max_iterations
  iteration += 1;
  
  % Atualizar as soluções
  for i = 1:n
    x(i) = (1 - w) * x_old(i) + w * (b(i) - A(i, [1:i-1, i+1:n]) * x([1:i-1, i+1:n])) / A(i, i);
  end
  
  % Calcular o erro relativo percentual e o erro absoluto
  relative_error = abs((x - x_old) ./ x) * 100;
  absolute_error = abs(x - x_old);
  
  % Armazenar o erro máximo e o desvio padrão na lista de erros e desvios padrão
  errors_relative = [errors_relative, max(relative_error)];
  errors_absolute = [errors_absolute, max(absolute_error)];
  std_devs = [std_devs, std(absolute_error)];
  
  % Exibir a iteração e a solução atual
  disp(['Iteração ', num2str(iteration), ':']);
  disp(x);
  
  % Verificar se o erro relativo percentual máximo é menor que Es
  if max(relative_error) <= Es
    break;
  end
  
  % Atualizar x_old
  x_old = x;
end

% Exibir o número de iterações e a solução final
disp(['Número de iterações: ', num2str(iteration)]);
disp(['Solução final:']);
disp(x);

% Gerar gráficos de convergência
figure;
subplot(3, 1, 1);
plot(1:iteration, errors_relative, 'o-');
xlabel('Número de iterações');
ylabel('Erro relativo percentual máximo');
title('Convergência do método de Gauss-Seidel com relaxamento (Erro relativo)');
grid on;

subplot(3, 1, 2);
plot(1:iteration, errors_absolute, 'o-');
xlabel('Número de iterações');
ylabel('Erro absoluto máximo');
title('Convergência do método de Gauss-Seidel com relaxamento (Erro absoluto)');
grid on;

subplot(3, 1, 3);
plot(1:iteration, std_devs, 'o-');
xlabel('Número de iterações');
ylabel('Desvio padrão');
title('Convergência do método de Gauss-Seidel com relaxamento (Desvio padrão)');
grid on;
