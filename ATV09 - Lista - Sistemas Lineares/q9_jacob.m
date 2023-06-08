% Montar a matriz A e o vetor b
A = [10, 2, -1;
     -3, -6, 2;
     1, 1, 5];
b = [27; -61.5; -21.5];

% Numero de variaveis
n = length(b);

% Criterio de parada (erro relativo percentual)
Es = 0.05; % 5%

% Inicializar o vetor de solucoes x
x = zeros(n, 1);
x_old = x;

% Inicializar o contador de iteracoes e os vetores para armazenar os erros
iteration = 0;
errors_relative = [];
errors_absolute = [];
std_devs = [];

% Jacobi
while true
  iteration += 1;
  
  % Atualizar as solucoes
  for i = 1:n
    x(i) = (b(i) - A(i, [1:i-1, i+1:n]) * x_old([1:i-1, i+1:n])) / A(i, i);
  end
  
  % Calcular o erro relativo percentual e o erro absoluto
  relative_error = abs((x - x_old) ./ x) * 100;
  absolute_error = abs(x - x_old);
  
  % Armazenar o erro maximo e o desvio padrao na lista de erros e desvios padrao
  errors_relative = [errors_relative, max(relative_error)];
  errors_absolute = [errors_absolute, max(absolute_error)];
  std_devs = [std_devs, std(absolute_error)];
  
  % Exibir a iteracao e a solucao atual
  disp(['Iteracao ', num2str(iteration), ':']);
  disp(x);
  
  % Verificar se o erro relativo percentual maximo e menor que Es
  if max(relative_error) < Es
    break;
  end
  
  % Atualizar x_old
  x_old = x;
end

% Exibir o numero de iteracoes e a solucao final
disp(['Numero de iteracoes: ', num2str(iteration)]);
disp(['Solucao final:']);
disp(x);

% Gerar graficos de convergencia
figure;
subplot(3, 1, 1);
plot(1:iteration, errors_relative, 'o-');
xlabel('Numero de iteracoes');
ylabel('Erro relativo percentual maximo');
title('Convergencia do metodo de Jacobi (Erro relativo)');
grid on;

subplot(3, 1, 2);
plot(1:iteration, errors_absolute, 'o-');
xlabel('Numero de iteracoes');
ylabel('Erro absoluto maximo');
title('Convergencia do metodo de Jacobi (Erro absoluto)');
grid on;

subplot(3, 1, 3);
plot(1:iteration, std_devs, 'o-');
xlabel('Numero de iteracoes');
ylabel('Desvio padrao');
title('Convergencia do metodo de Jacobi (Desvio padrao)');
grid on;
