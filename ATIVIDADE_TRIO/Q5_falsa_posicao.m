u = 1800; % velocidade na qual o combustível é expelido em relação ao foguete
m0 = 1600000; % massa inicial do foguete no instante t = 0
q = 2600; % taxa de consumo do combustível
g = 9.81; % aceleração da gravidade

% função para calcular a velocidade de subida do foguete
f = @(t) u*log(m0/(m0-q*t))-g*t;

% limite inferior e superior do intervalo de busca
a = 10;
b = 50;

% tolerância de erro
tol = 0.01;

% número máximo de iterações
maxiter = 100;

% inicialização do erro
err = Inf;

% número de iterações
iter = 0;

while err > tol && iter < maxiter
    % cálculo dos valores da função nos pontos a e b
    fa = f(a);
    fb = f(b);
    
    % cálculo do ponto c pela regra da falsa posição
    c = b - (fb*(b-a))/(fb-fa);
    
    % cálculo do valor da função no ponto c
    fc = f(c);
    
    % atualização do intervalo de busca
    if fa*fc < 0
        b = c;
    else
        a = c;
    end
    
    % atualização do erro
    err = abs(fc);
    
    % atualização do número de iterações
    iter = iter + 1;
end

% exibição do resultado
printf("Tempo em que a velocidade é 750m/s: %.2f s\n", c);
