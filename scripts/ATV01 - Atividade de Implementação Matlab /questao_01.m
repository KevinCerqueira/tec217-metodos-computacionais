while true
    % Passo 1: Pedir ao usuário os coeficientes a, b e c
    a = input('Digite o coeficiente a: ');
    b = input('Digite o coeficiente b: ');
    c = input('Digite o coeficiente c: ');
    
    % Passo 2: Implementar a fórmula quadrática
    delta = b^2 - 4*a*c; % calcula o discriminante
    
    % Passo 3: Mostrando as saídas
    if a == 0
        if b == 0
            if c == 0
                % solução trivial: qualquer x é raiz
                disp('A equacao e uma identidade verdadeira para qualquer valor de x')
            else
                % equação impossível: não há raízes reais
                disp('A equacao nao tem raizes reais')
            end
        else
            % equação do 1º grau: uma raiz real
            x = -c/b;
            disp(['A equacao tem uma raiz real: x = ', num2str(x)])
        end
    else
        if delta > 0
            % duas raízes reais e distintas
            x1 = (-b + sqrt(delta))/(2*a);
            x2 = (-b - sqrt(delta))/(2*a);
            disp(['A equacao tem duas raizes reais e distintas: x1 = ', num2str(x1), ', x2 = ', num2str(x2)])
        elseif delta == 0
            % uma raiz real e dupla
            x = -b/(2*a);
            disp(['A equacao tem uma raiz real e dupla: x = ', num2str(x)])
        else
            % duas raízes complexas
            realPart = -b/(2*a);
            imagPart = sqrt(-delta)/(2*a);
            disp(['A equacao tem duas raizes complexas conjugadas: x1 = ', num2str(realPart), ' + ', num2str(imagPart), 'i', ', x2 = ', num2str(realPart), ' - ', num2str(imagPart), 'i'])
        end
    end
    
    % Passo 4: Permitir ao usuário retornar ao Passo 1
    resposta = input('Deseja calcular as raizes de outra equacao? (s/n): ', 's');
    if resposta ~= 'S' && resposta ~= 's'
        break % sair do loop
    end
end
