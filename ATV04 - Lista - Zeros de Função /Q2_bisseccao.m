% Definir funções de crescimento populacional
Pu = @(t) 80000 * exp(-0.05*t) + 110000;
Ps = @(t) 320000 / (1 + ((320000/10000) - 1) * exp(-0.09*t));

% Definir equação a ser resolvida
eqn = @(t) Ps(t) - 1.2*Pu(t);

% Definir intervalo inicial e tolerância
a = 0;
b = 100;
tol = 1e-6;

% Aplicar o método da bissecção
while abs(b-a) > tol
    c = (a + b) / 2;
    if eqn(a)*eqn(c) < 0
        b = c;
    else
        a = c;
    end
end

% Mostrar resultado
t = (a + b) / 2;
fprintf('Tempo: %.2f anos\n', t);
fprintf('População urbana: %.2f pessoas\n', Pu(t));
fprintf('População suburbana: %.2f pessoas\n', Ps(t));
