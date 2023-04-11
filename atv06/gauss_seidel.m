function [x, itr, Erx, msg] = gauss_seidel(A, b, x0, tol, maxitr)

  % Verifica se a matriz A é quadrada e se o número de linhas de A é igual ao número de elementos em b
  if size(A,1) ~= size(A,2) || size(A,1) ~= length(b)
    msg = "Erro: A matriz A não é quadrada ou não possui o mesmo número de linhas que o vetor b.";
    x = [];
    itr = 0;
    Erx = [];
    return;
  end
  
  % Verifica se a matriz A satisfaz o critério de Sassenfeld
  beta = zeros(size(A,1),1);
  for i = 1:size(A,1)
    beta(i) = sum(abs(A(i,1:i-1))) + sum(abs(A(i,i+1:end))) / abs(A(i,i));
    if beta(i) >= 1
      msg = "Erro: A matriz A não satisfaz o critério de Sassenfeld.";
      x = [];
      itr = 0;
      Erx = [];
      return;
    end
  end
  
  % Inicializa as variáveis
  x = x0;
  itr = 0;
  Erx = Inf;
  
  % Itera até que a tolerância seja alcançada ou que o número máximo de iterações seja atingido
  while Erx > tol && itr < maxitr
    x_old = x;
    for i = 1:size(A,1)
      x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:end)*x_old(i+1:end)) / A(i,i);
    end
    itr = itr + 1;
    Erx = max(abs(x - x_old));
  end
  
  % Verifica se o número máximo de iterações foi atingido
  if itr == maxitr
    msg = "Atingido o número máximo de iterações sem atingir a tolerância.";
  else
    msg = "Sucesso: A tolerância foi alcançada.";
  end
  
end
