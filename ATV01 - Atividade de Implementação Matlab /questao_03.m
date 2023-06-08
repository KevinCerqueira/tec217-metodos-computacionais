% Calculando o volume do tanque para cada valor de d
while true
  R = input("Digite o valor de R: ");
  d = input("Digite o valor do d: ");
  
  if d > 3*R
    % Caso d > 3R, retorna a mensagem de erro "Transbordo"
    disp("Transbordo");
  else
    if d <= R
      % Caso o nível do líquido esteja na parte cônica do tanque
      V = pi/3 * d^2 * (3*R - d);
    else
      % Caso o nível do líquido esteja na parte cilíndrica do tanque
      h = d - R;
      V = pi/3 * R^2 * (3 - h/R) * h + pi * R^2 * (h/R);
    end
    % Exibe o volume para o valor de d atual
    disp(["Volume para d = ", num2str(d), " é ", num2str(V)]);
  end
  
  resposta = input('Deseja verificar mais algum valor? (s/n): ', 's');
  if resposta ~= 'S' && resposta ~= 's'
      break % sair do loop
  end
end
