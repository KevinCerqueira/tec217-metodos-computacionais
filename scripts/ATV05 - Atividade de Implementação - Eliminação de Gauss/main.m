A = [2 3 -1; 4 4 -3; 2 -3 1];
b = [5 3 -1]';

x = eliminacao_gauss(A, b);
fprintf("\n\nRetrosubstituição:\n");
disp(x);