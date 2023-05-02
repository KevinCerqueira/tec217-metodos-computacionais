% Valor desejado
target_C2 = 15;

% Interpolação linear
interp_linear = interp2(C, T, O2, target_C2, target_T, 'linear');

% Exibir resultado
disp('Resultado usando interpolação linear:');
disp(interp_linear);
