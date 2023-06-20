t = [1, 2, 3.25, 4.5, 6, 7, 8, 8.5, 9, 10];  % Valores do tempo
v = [5, 6, 5.5, 7, 8.5, 8, 6, 7, 7, 5];  % Valores da velocidade

% Cálculo da distância percorrida usando a regra do trapézio
n = length(t) - 1;  % Número de subintervalos
h = diff(t);  % Diferenças entre os valores do tempo
distance = 0;
for i = 1:n
    distance = distance + (h(i) / 2) * (v(i) + v(i+1));
end

% Cálculo da velocidade média
average_velocity = mean(v);

fprintf('\n Distância: %f\n', distance);
fprintf('\n Velocidade média: %f\n', average_velocity);
