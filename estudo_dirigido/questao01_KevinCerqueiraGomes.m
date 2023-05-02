x = [0, 1, 2.5, 3, 4.5, 5, 6];
y = [2, 5.4375, 7.3516, 7.5625, 8.4453, 9.1875, 12];

xi = 3.5;
yi = interp1(x, y, xi, 'pchip'); % 'pchip' é o método Piecewise Cubic Hermite Interpolating Polynomial
fprintf("Usando a funcao interp1: \n");
disp(yi);

x = [0, 1, 2.5, 3, 4.5, 5, 6];
y = [2, 5.4375, 7.3516, 7.5625, 8.4453, 9.1875, 12];

xi = 3.5;
p = polyfit(x, y, 4); % Ajustar um polinômio de 4ª ordem
yi = polyval(p, xi); % Avaliar o polinômio ajustado no ponto xi
fprintf("\nUsando as funcoes polyfit e polyval: \n");
disp(yi);
