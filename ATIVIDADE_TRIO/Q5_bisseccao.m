u = 1800; % velocidade na qual o combustível é expelido em relação ao foguete
m0 = 1600000; % massa inicial do foguete no instante t = 0
q = 2600; % taxa de consumo do combustível
g = 9.81; % aceleração da gravidade (m/(s^2))
v_target = 750; % velocidade de subida desejada

% Função que calcula a velocidade de subida do foguete em um dado instante t
f = @(t) u*log(m0/(m0 - q*t)) - g*t;

a = 10; % chute inicial inferior
b = 50; % chute inicial superior

% Define a tolerância desejada para o resultado (1%)
tolerance = 0.01;
max_iterations = 100;

for i = 1:max_iterations
    c = (a + b) / 2;
    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
    
    if abs(f(c)) < tolerance
        break;
    end
end

fprintf('Tempo no qual v = 750 m/s: %f s\n', c);