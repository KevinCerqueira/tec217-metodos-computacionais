x = [0, 0.5, 1];
y1 = [1, 2.12, 3.55];
y2 = [1.3, 2.5, 0.9];

V = [1,  0,   0;
     1, 0.5, 0.25;
     1,  1,   1];

a = V / y1;
b = V / y2;

fprintf("a: ");
disp(a);
fprintf("\nb: ");
disp(b);

x_plot = linspace(0, 1, 100); % Cria um vetor de 100 pontos entre 0 e 1

% Calcula os valores dos polinômios interpoladores nos pontos x_plot
P1_plot = polyval(flip(a), x_plot);
P2_plot = polyval(flip(b), x_plot);

% Plota os gráficos dos polinômios interpoladores
figure;
subplot(2, 1, 1);
plot(x, y1, 'o', x_plot, P1_plot, '-');
xlabel('x');
ylabel('P1(x)');
title('Polinomio interpolador P1(x)');
legend('Pontos originais', 'P1(x)');
grid on;

subplot(2, 1, 2);
plot(x, y2, 'o', x_plot, P2_plot, '-');
xlabel('x');
ylabel('P2(x)');
title('Polinomio interpolador P2(x)');
legend('Pontos originais', 'P2(x)');
grid on;
