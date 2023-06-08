function [Xr, iter] = metodo_iteracao_linear(f, X0, tol, max_iter)
% f: função a ser resolvida
% X0: aproximação inicial
% tol: tolerância para o erro absoluto
% max_iter: número máximo de iterações permitido

iter = 0; % inicializa o contador de iterações
Xr = X0; % define a primeira aproximação como a aproximação inicial

while iter < max_iter
    Xr_anterior = Xr; % armazena o valor da aproximação anterior
    Xr = f(Xr_anterior); % aplica a função iterativa para obter a nova aproximação
    
    % calcula os erros aproximado e verdadeiro
    erro_aproximado = abs(Xr - Xr_anterior);
    erro_verdadeiro = abs(f(Xr));
    
    % verifica se a solução foi encontrada com a tolerância desejada
    if erro_aproximado < tol || erro_verdadeiro < tol
        return
    end
    
    iter = iter + 1; % incrementa o contador de iterações
end

% caso o número máximo de iterações seja atingido, a solução não foi encontrada
error("Não foi possível encontrar uma solução dentro do número máximo de iterações permitido.");
end

# Plotagem dos gráficos de erro
plot(1:length(erros_aprox), erros_aprox, '-o', 'LineWidth', 2);
hold on;
plot(1:length(erros_verd), erros_verd, '-s', 'LineWidth', 2);
xlabel('Número de iterações');
ylabel('Erro');
legend('Erro Aproximado', 'Erro Verdadeiro');