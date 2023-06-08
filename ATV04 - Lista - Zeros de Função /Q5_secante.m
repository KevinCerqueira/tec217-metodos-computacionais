u = 1800;       % velocidade de expulsão do combustível (m/s)
m0 = 1600000;   % massa inicial do foguete (kg)
q = 2600;       % taxa de consumo de combustível (kg/s)
g = 9.81;       % aceleração da gravidade (m/s^2)
v = 750;        % velocidade de subida desejada (m/s)

f = @(t) u*log(m0/(m0-q*t)) - g*t - v;  % função a ser resolvida
tol = 0.01;     % tolerância de erro (1%)

% aproximações iniciais
x0 = 10;
x1 = 20;

while abs(x1-x0)/x1 > tol
    x2 = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));   % fórmula da Secante
    x0 = x1;
    x1 = x2;
end

t = x1;
fprintf("Tempo no qual v = 750 m/s: %.2f s\n\n\n\n", t);
