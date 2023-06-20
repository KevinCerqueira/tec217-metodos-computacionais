q = 2e-5;   % carga q em Coulombs
Q = 2e-5;   % carga Q em Coulombs
a = 0.85;   % raio do anel em metros
e0 = 8.9e-12;   % constante de permissividade elétrica em Nm^2/C^2
F = 1.25;   % força em Newtons
tolerance = 1e-6;   % tolerância desejada

% define o intervalo inicial
a = 0;
b = 1;

while (b - a) > tolerance
    % calcula o ponto médio do intervalo
    c = (a + b) / 2;
    
    % calcula a força no ponto médio
    force = (1 / (4 * pi * e0)) * (q * Q * c / (c^2 + a^2)^(3/2));
    
    % atualiza o intervalo
    if force > F
        b = c;
    else
        a = c;
    end
end

% imprime o resultado final
disp(['A distância x é de ' num2str(c) ' metros.']);
