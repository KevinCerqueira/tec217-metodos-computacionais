u = 1800;  % velocidade na qual o combustível é expelido em relação ao foguete
m0 = 1600000;  % massa inicial do foguete no instante t = 0
q = 2600;  % taxa de consumo do combustível
g = 9.81;  % aceleração da gravidade (m/s^2)
epsilon = 0.01;  % tolerância de erro de 1%

% chute inicial
t = 20;

% loop até encontrar a solução ou atingir o número máximo de iterações
for i = 1:100
    % calcular a velocidade de subida e sua derivada com o chute atual de t
    v = u*log(m0/(m0-q*t)) - g*t;
    dv_dt = u*q/(m0-q*t) - g;
    
    % verificar se a solução foi encontrada com a tolerância de erro
    if abs(v - 750) < epsilon * 750
        fprintf("Tempo no qual v = 750 m/s: %.2f s\n\n\n\n", t);
        break;
    end
    
    % calcular a nova estimativa de t com o método de Newton-Raphson
    t = t - (v - 750) / dv_dt;
end

% se o loop terminar sem encontrar a solução, exibir mensagem de erro
if i == 100
    printf("Não foi possível encontrar uma solução com a tolerância de erro especificada.\n");
end
