% Dados de entrada
x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
y = [1.3, 3.5, 4.2, 5.0, 7.0, 8.8, 10.1, 12.5, 13.0, 14.6];

% Teste inicial
if length(x) != length(y)
    error("Os vetores devem ter o mesmo tamanho.");
end

n = length(x);

% Cálculo dos somatórios
Sx = sum(x);
Sy = sum(y);
Sx2 = sum(x.^2);
Sxy = sum(x.*y);
Sy2 = sum(y.^2);

% Cálculo dos coeficientes de ajuste
a(1) = (n*Sxy - Sx*Sy) / (n*Sx2 - Sx^2);
a(2) = mean(y) - a(1)*mean(x);

% Cálculo das estatísticas
St = sum((y - mean(y)).^2);
Sr = sum((y - a(2) - a(1)*x).^2);
Sy = sqrt(St / (n - 1));
Sy_x = sqrt(Sr / (n - 2));
r2 = (St - Sr) / St;

% Saída: coeficientes e estatísticas
fprintf("Coeficientes:\n");
fprintf("a(1) = %.4f\n", a(1));
fprintf("a(2) = %.4f\n", a(2));
fprintf("Coeficiente de determinação (r^2) = %.4f\n", r2);
fprintf("Desvio padrão total (Sy) = %.4f\n", Sy);
fprintf("Erro-padrão da estimativa (Sy/x) = %.4f\n", Sy_x);

% Gráfico
figure;
plot(x, y, 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
hold on;
x_fit = linspace(min(x), max(x), 100);
y_fit = a(2) + a(1)*x_fit;
plot(x_fit, y_fit, 'r', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('Ajuste Linear por Mínimos Quadrados');
legend('Dados', 'Ajuste Linear');
grid on;
hold off;
