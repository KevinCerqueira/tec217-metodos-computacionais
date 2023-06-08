% Definir os valores x1, x2 e x3
x1 = 4;
x2 = 2;
x3 = 7;

% Criar a matriz de Vandermonde
V = [x1^2, x1, 1;
     x2^2, x2, 1;
     x3^2, x3, 1];

% Calcular a matriz inversa de V
V_inv = inv(V);

% Calcular as normas das matrizes V e V_inv (norma da soma das linhas)
norm_V = max(sum(abs(V), 2));
norm_V_inv = max(sum(abs(V_inv), 2));

% Calcular o número de condição
condition_number = norm_V * norm_V_inv;

% Exibir o número de condição
disp(['O numero de condicao da matriz de Vandermonde eh: ', num2str(condition_number)]);
