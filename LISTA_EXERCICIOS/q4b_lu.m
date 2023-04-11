% Novo vetor B
B_alt = [12; 8; -6];

% Resolver o sistema Ly = b usando a substituição progressiva
y_alt = zeros(3, 1);
for i = 1:3
  y_alt(i) = B_alt(i) - L(i, 1:(i - 1)) * y_alt(1:(i - 1));
end

% Resolver o sistema Ux = y usando a substituição regressiva
X_alt = zeros(3, 1);
for i = 3:-1:1
  X_alt(i) = (y_alt(i) - U(i, (i + 1):3) * X_alt((i + 1):3)) / U(i, i);
end

% Exibir os resultados
fprintf('x1 = %f\n', X_alt(1));
fprintf('x2 = %f\n', X_alt(2));
fprintf('x3 = %f\n', X_alt(3));
