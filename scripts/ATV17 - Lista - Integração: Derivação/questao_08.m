r0 = 0.5;  % Raio do tubo em metros
n = 8;  % Valor de n
vmax = 1.5;  % Velocidade máxima em m/s

% Cálculo da velocidade média do fluxo de óleo
f = @(r) r .* (1 - (r/r0)).^(1/n);  % Função do perfil de velocidade
vmedia = (2 * vmax / (2*r0)) * quadgk(f, 0, r0);

vmedia
