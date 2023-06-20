A = [2 -6 -1; -3 -1 7; -8 1 -2];
b = [-38 -34 -20];

x = eliminacao_gauss_pivot(A, b);
fprintf("\n\nRetrosubstituição:\n");
disp(x);