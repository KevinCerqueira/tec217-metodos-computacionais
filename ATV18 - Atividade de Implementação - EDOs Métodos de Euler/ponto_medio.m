function I = ponto_medio(h, t_end)

    % Define os parâmetros do circuito
    L = 50e-3;  % indutância em Henry
    R = 20;     % resistência em Ohm
    E = 10;     % fonte em Volt

    % Inicializa o vetor de corrente com zeros
    I = zeros(1, t_end/h);

    % Define a condição inicial
    I(1) = 0;

    % Loop sobre cada instante de tempo
    for t = 2:t_end/h
    
        % Calcula a primeira estimativa (k1)
        k1 = h*((E - R*I(t-1))/L);
        
        % Calcula a segunda estimativa (k2), usando o valor médio do intervalo
        
        k2 = h*((E - R*(I(t-1) + k1/2))/L);
        % Atualiza a corrente com o valor de k2
        I(t) = I(t-1) + k2;
    end
end
