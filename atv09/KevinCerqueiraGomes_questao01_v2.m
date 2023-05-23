% Dados fornecidos
X = [0; 1; 2; 3; 4; 5];
Y = [0; 20; 60; 68; 77; 100];

% Graus das regressões
graus = [1, 5];

% Loop para cada grau
for i = 1:length(graus)
  % Ajuste polinomial
  p = polyfit(X, Y, graus(i));
  
  % Avaliação do polinômio
  Y_fit = polyval(p, X);
  
  % Cálculo do coeficiente de determinação R²
  Y_mean = mean(Y);
  SS_tot = sum((Y - Y_mean).^2);
  SS_res = sum((Y - Y_fit).^2);
  R2 = 1 - SS_res / SS_tot;
  
  % Printa o R²
  fprintf('R² para o ajuste de grau %d: %f\n', graus(i), R2);
  
  % Plota os dados e a curva de ajuste
  figure(i)
  plot(X, Y, 'bo'); % Valores reais
  hold on;
  X_plot = linspace(min(X), max(X), 100);
  Y_plot = polyval(p, X_plot);
  plot(X_plot, Y_plot, 'r-'); % Ajuste polinomial
  title(sprintf('Ajuste polinomial de grau %d', graus(i)));
  xlabel('X');
  ylabel('Y');
  legend('Dados', 'Ajuste polinomial');
  hold off;
end
