t = [1, 2, 3.25, 4.5, 6, 7, 8, 8.5, 9, 10];  % Valores do tempo
v = [5, 6, 5.5, 7, 8.5, 8, 6, 7, 7, 5];  % Valores da velocidade

% Ajuste dos dados com uma equação cúbica usando regressão polinomial
degree = 3;  % Grau do polinômio
coefficients = polyfit(t, v, degree);

% Cálculo da distância percorrida
p = polyint(coefficients);
distance = polyval(p, t(end)) - polyval(p, t(1));

fprintf('\n Distância: %f\n', distance);

