x0 = 0; xf = 1; y0 = 1;
x = x0:0.25:xf;

function dydt = myode(x, y)
  dydt = (1 + 4*x)*sqrt(y);
endfunction

% Método de Euler
h = 0.25;
y_euler = zeros(1, length(x));
y_euler(1) = y0;
for i = 1:(length(x)-1)
  y_euler(i+1) = y_euler(i) + h*myode(x(i), y_euler(i));
end
disp('B) do Método de Euler:')
disp(y_euler)

% Método de Heun
y_heun = zeros(1, length(x));
y_heun(1) = y0;
for i = 1:(length(x)-1)
  k1 = h*myode(x(i), y_heun(i));
  k2 = h*myode(x(i)+h, y_heun(i)+k1);
  y_heun(i+1) = y_heun(i) + (k1+k2)/2;
end
disp('C) do Método de Heun:')
disp(y_heun)

% Método de Ralston
y_ralston = zeros(1, length(x));
y_ralston(1) = y0;
for i = 1:(length(x)-1)
  k1 = h*myode(x(i), y_ralston(i));
  k2 = h*myode(x(i)+0.75*h, y_ralston(i)+0.75*k1);
  y_ralston(i+1) = y_ralston(i) + (1/3)*k1 + (2/3)*k2;
end
disp('D) do Método de Ralston:')
disp(y_ralston)

% RK3
y_rk3 = zeros(1, length(x));
y_rk3(1) = y0;
for i = 1:(length(x)-1)
  k1 = h*myode(x(i), y_rk3(i));
  k2 = h*myode(x(i)+h/2, y_rk3(i)+k1/2);
  k3 = h*myode(x(i)+h, y_rk3(i)-k1+2*k2);
  y_rk3(i+1) = y_rk3(i) + (k1+4*k2+k3)/6;
end
disp('E.1) do Método de Runge-Kutta de 3ª ordem:')
disp(y_rk3)

% RK4
y_rk4 = zeros(1, length(x));
y_rk4(1) = y0;
for i = 1:(length(x)-1)
  k1 = h*myode(x(i), y_rk4(i));
  k2 = h*myode(x(i)+h/2, y_rk4(i)+k1/2);
  k3 = h*myode(x(i)+h/2, y_rk4(i)+k2/2);
  k4 = h*myode(x(i)+h, y_rk4(i)+k3);
  y_rk4(i+1) = y_rk4(i) + (k1+2*k2+2*k3+k4)/6;
end
disp('E.2) do Método de Runge-Kutta de 4ª ordem:')
disp(y_rk4)

% Plot
hold on
plot(x, y_euler, 'b')
plot(x, y_heun, 'g')
plot(x, y_ralston, 'r')
plot(x, y_rk3, 'c')
plot(x, y_rk4, 'm')
legend('Euler', 'Heun', 'Ralston', 'RK3', 'RK4')
hold off
