% Montar a matriz A e o vetor b
A = [0.8, -0.4, 0;
     -0.4, 0.8, -0.4;
     0, -0.4, 0.8];
b = [41; 25; 105];

% Número de variáveis
n = length(b);

% Critério de parada (erro relativo percentual)
Es = 0.05; % 5%

% Inicializar o vetor de soluções x
x = zeros(n, 1);
x_old = x;

% Inicializar o contador de iterações e os vetores para armazenar os erros
iteration = 0;
errors_relative = [];
errors_absolute = [];
std_devs = [];

% Gauss-Seidel
while true
  iteration += 1;
  
  % Atualizar as soluções
  for i = 1:n
    x(i) = (b(i) - A(i, [1:i-1, i+1:n]) * x([1:i-1, i+1:n])) / A(i, i);
  end
  
  % Calcular o erro relativo percentual e o erro absoluto
  relative_error = abs((x - x_old) ./ x) * 100;
  absolute_error = abs(x - x_old);
  
  % Armazenar o erro máximo e o desvio padrão na lista de erros e desvios padrão
  errors_relative = [errors_relative, max(relative_error)];
  errors_absolute = [errors_absolute, max(absolute_error)];
  std_devs = [std_devs, std(absolute_error)];
  
  % Exibir a iteração e a solução atual
  disp(['Iteracao ', num2str(iteration), ':']);
  disp(x);
  
  % Verificar se o erro relativo percentual máximo é menor que Es
  if max(relative_error) < Es
    break;
  end
  
  % Atualizar x_old
  x_old = x;
end

% Exibir o número de iterações e a solução final
disp(['Numero de iteracoes: ', num2str(iteration)]);
disp(['Solucao final:']);
disp(x);

% Gerar gráficos de convergência
figure;
subplot(3, 1, 1);
plot(1:iteration, errors_relative, 'o-');
xlabel('Numero de iteracoes');
ylabel('Erro relativo percentual maximo');
title('Convergencia do metodo de Gauss-Seidel (Erro relativo)');
grid on;

subplot(3, 1, 2);
plot(1:iteration, errors_absolute, 'o-');
xlabel('Numero de iteracoes');
ylabel('Erro absoluto maximo');
title('Convergência do metodo de Gauss-Seidel (Erro absoluto)');
grid on;

subplot(3, 1, 3);
plot(1:iteration, std_devs, 'o-');
xlabel('Numero de iteracoes');
ylabel('Desvio padrao');
title('Convergencia do metodo de Gauss-Seidel (Desvio padrao)');
grid on;
