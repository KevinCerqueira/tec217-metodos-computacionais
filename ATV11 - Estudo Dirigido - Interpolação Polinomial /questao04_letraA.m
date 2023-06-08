% Dados fornecidos
T = [0, 5, 10, 15, 20, 25, 30];
C = [0, 10, 20];
O2 = [14.6, 12.9, 11.4;
      12.8, 11.3, 10.3;
      11.3, 10.1, 8.96;
      10.1, 9.03, 8.08;
      9.09, 8.17, 7.35;
      8.26, 7.46, 6.73;
      7.56, 6.85, 6.20];

% Valores desejados
target_T = 12;
target_C = 10;

% Interpolação quadrática e cúbica
interp_quad = interp2(C, T, O2, target_C, target_T, 'linear');
interp_cubic = interp2(C, T, O2, target_C, target_T, 'cubic');

% Exibir resultados
disp('Resultado usando interpolação quadrática:');
disp(interp_quad);
disp('Resultado usando interpolação cúbica:');
disp(interp_cubic);
