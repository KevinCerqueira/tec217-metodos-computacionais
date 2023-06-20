R = 1;
V_deslocado = 1.5;
h0 = 0.4;
h1 = 0.6;
tol = 1e-6;
max_iter = 100;

% Define a função f(h)
f = @(h) (pi/3) * h^2 * (3*R - h) - V_deslocado;

% Define a tolerância e o número máximo de iterações
if nargin < 5
tol = 1e-6;
end
if nargin < 6
max_iter = 100;
end

% Aplica o método da Secante
for i = 1:max_iter
% Calcula a correção delta_h
delta_h = -f(h1)*(h1 - h0)/(f(h1) - f(h0));

% Atualiza o valor de h
h = h1 + delta_h;

% Verifica se a solução convergiu
if abs(f(h)) < tol
  fprintf('h = %f m\n', h);
  fprintf('ou aproximadamente: %.2f centímetros\n\n', h*100);
  break;
end

% Atualiza os valores de h0 e h1
h0 = h1;
h1 = h;
end



