% Definindo os dados
x = [3 4 5 7 8 9 11 12]; 
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];

% Ajustando um polinômio cúbico aos dados
p = polyfit(x, y, 3);

% Preparando os dados para o gráfico
x_fit = linspace(min(x), max(x), 100);
y_fit = polyval(p, x_fit);

% Calculando r^2
y_mean = mean(y);
SSR = sum((polyval(p, x) - y_mean).^2);
SST = sum((y - y_mean).^2);
r2 = SSR / SST;

% Calculando Sy/x
n = length(x);
Syx = sqrt((1 / (n - 4)) * sum((y - polyval(p, x)).^2));

% Mostrando os coeficientes, r^2 e Sy/x
printf("Coeficientes: %f, %f, %f, %f\n", p(1), p(2), p(3), p(4));
printf("r^2: %f\n", r2);
printf("Sy/x: %f\n", Syx);

% Criando o gráfico
figure;
plot(x, y, 'bo', x_fit, y_fit, 'r-');
title("Ajuste de polinômio cúbico");
xlabel("x");
ylabel("y");
legend('Dados', 'Ajuste de polinômio cúbico');
