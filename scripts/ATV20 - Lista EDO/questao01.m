t0 = 0; tf = 2; y0 = 1;
t = t0:0.5:tf;

function dydt = myode(t, y)
  dydt = (y*t)^3 - 1.5*y;
endfunction

% Método de Euler
h = 0.5;
y_euler = zeros(1, length(t));
y_euler(1) = y0;
for i = 1:(length(t)-1)
  y_euler(i+1) = y_euler(i) + h*myode(t(i), y_euler(i));
end
disp(['B.1) Euler h = 0.5: ', num2str(y_euler)]);

% Método de Euler com h = 0.25
h = 0.25;
t2 = t0:h:tf;
y_euler2 = zeros(1, length(t2));
y_euler2(1) = y0;
for i = 1:(length(t2)-1)
  y_euler2(i+1) = y_euler2(i) + h*myode(t2(i), y_euler2(i));
end
disp(['B.2) Euler h = 0.25: ', num2str(y_euler2)]);

% Método do Ponto Médio
h = 0.5;
y_mid = zeros(1, length(t));
y_mid(1) = y0;
for i = 1:(length(t)-1)
  k1 = h*myode(t(i), y_mid(i));
  k2 = h*myode(t(i)+h/2, y_mid(i)+k1/2);
  y_mid(i+1) = y_mid(i) + k2;
end
disp(['C) Ponto médio h = 0.5: ', num2str(y_mid)]);

% RK3
y_rk3 = zeros(1, length(t));
y_rk3(1) = y0;
for i = 1:(length(t)-1)
  k1 = h*myode(t(i), y_rk3(i));
  k2 = h*myode(t(i)+h/2, y_rk3(i)+k1/2);
  k3 = h*myode(t(i)+h, y_rk3(i)-k1+2*k2);
  y_rk3(i+1) = y_rk3(i) + (k1+4*k2+k3)/6;
end
disp(['D.1) RK3 h = 0.5: ', num2str(y_rk3)]);

% RK4
y_rk4 = zeros(1, length(t));
y_rk4(1) = y0;
for i = 1:(length(t)-1)
  k1 = h*myode(t(i), y_rk4(i));
  k2 = h*myode(t(i)+h/2, y_rk4(i)+k1/2);
  k3 = h*myode(t(i)+h/2, y_rk4(i)+k2/2);
  k4 = h*myode(t(i)+h, y_rk4(i)+k3);
  y_rk4(i+1) = y_rk4(i) + (k1+2*k2+2*k3+k4)/6;
end
disp(['D.2) RK4 h = 0.5: ', num2str(y_rk4)]);

% Plot
hold on
plot(t, y_euler, 'b')
plot(t2, y_euler2, 'g')
plot(t, y_mid, 'r')
plot(t, y_rk3, 'c')
plot(t, y_rk4, 'm')
legend('Euler h = 0.5', 'Euler h = 0.25', 'Ponto Médio', 'RK3', 'RK4')
hold off
