t0 = 0; tf = 2; y0 = 1;
t = t0:0.5:tf;

function dydt = myode(t, y)
  dydt = -2*y + t^2;
endfunction

% Método de Heun sem iteração
h = 0.5;
y_heun = zeros(1, length(t));
y_heun(1) = y0;
for i = 1:(length(t)-1)
  k1 = h*myode(t(i), y_heun(i));
  k2 = h*myode(t(i)+h, y_heun(i)+k1);
  y_heun(i+1) = y_heun(i) + (k1+k2)/2;
end
disp('A) do Método de Heun sem iteração:')
disp(y_heun)

% Método de Heun com iteração
y_heun_iter = zeros(1, length(t));
y_heun_iter(1) = y0;
for i = 1:(length(t)-1)
  predictor = y_heun_iter(i) + h*myode(t(i), y_heun_iter(i));
  es = 1; iter = 0;
  while es > 0.001
    y_old = predictor;
    predictor = y_heun_iter(i) + h/2*(myode(t(i), y_heun_iter(i)) + myode(t(i)+h, y_old));
    es = abs((predictor - y_old)/predictor)*100;
    iter = iter + 1;
  end
  y_heun_iter(i+1) = predictor;
end
disp('B) do Método de Heun com iteração:')
disp(y_heun_iter)

% Método do Ponto Médio
y_mid = zeros(1, length(t));
y_mid(1) = y0;
for i = 1:(length(t)-1)
  k1 = h*myode(t(i), y_mid(i));
  k2 = h*myode(t(i)+h/2, y_mid(i)+k1/2);
  y_mid(i+1) = y_mid(i) + k2;
end
disp('C) do Método do Ponto Médio:')
disp(y_mid)

% Método de Ralston
y_ralston = zeros(1, length(t));
y_ralston(1) = y0;
for i = 1:(length(t)-1)
  k1 = h*myode(t(i), y_ralston(i));
  k2 = h*myode(t(i)+0.75*h, y_ralston(i)+0.75*k1);
  y_ralston(i+1) = y_ralston(i) + (1/3)*k1 + (2/3)*k2;
end
disp('D) do Método de Ralston:')
disp(y_ralston)

% Plot
hold on
plot(t, y_heun, 'b')
plot(t, y_heun_iter, 'g')
plot(t, y_mid, 'r')
plot(t, y_ralston, 'c')
legend('Heun sem iteração', 'Heun com iteração', 'Ponto Médio', 'Ralston')
hold off
