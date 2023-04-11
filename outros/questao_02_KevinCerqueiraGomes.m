% Entrada: ângulo "x" em radianos
% Saída: valor do cosseno de "x" e erro relativo porcentual

x = input("Digite o valor do angulo em radianos: ");

n = 0; % inicializa o contador de termos da série
aprox = 1; % inicializa a aproximação com o primeiro termo (n = 0)

real = cos(x); % calcula o valor real do cosseno com a função de biblioteca

fprintf("Termo\tAproximacao\tErro relativo\n");

while true % loop infinito até que o usuário escolha sair
    termo = (-1)^n * x^(2*n) / factorial(2*n); % calcula o próximo termo
    aprox = aprox + termo; % atualiza a aproximação
    erro = abs((real - aprox) / real) * 100; % calcula o erro relativo em porcentagem
    fprintf("%d\t%10.6f\t%10.6f%%\n", n, aprox, erro); % exibe os resultados
    n = n + 1; % atualiza o contador de termos
    opcao = input("\nDigite 1 para adicionar mais um termo ou 0 para sair: ");
    if opcao == 0
        break; % sai do loop se o usuário escolher sair
    end
end

fprintf("\nValor real do cosseno de %f: %f\n", x, real); % exibe o valor real do cosseno
