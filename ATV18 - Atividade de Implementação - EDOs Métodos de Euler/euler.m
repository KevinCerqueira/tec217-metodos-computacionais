function I = euler(h, t_end)

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
    
        % Atualiza a corrente usando a equação diferencial e o método de Euler
        I(t) = I(t-1) + h*((E - R*I(t-1))/L);
    end
end
