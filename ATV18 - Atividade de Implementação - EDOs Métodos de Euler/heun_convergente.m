function I = heun_convergente(h, t_end, conv_threshold)
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
        % Faz a previsão usando o método de Euler
        predictor = I(t-1) + h*((E - R*I(t-1))/L);
        % Inicia a correção com o valor anterior
        corrector_prev = I(t-1);
        % Faz a primeira correção
        corrector = I(t-1) + h/2*((E - R*I(t-1))/L + (E - R*predictor)/L);

        % Loop até que a convergência seja alcançada
        while abs(corrector - corrector_prev) > conv_threshold
            % Atualiza o valor anterior
            corrector_prev = corrector;
            % Faz uma nova correção
            corrector = I(t-1) + h/2*((E - R*I(t-1))/L + (E - R*corrector_prev)/L);
        end

        % Atualiza a corrente com o valor corrigido
        I(t) = corrector;
    end
end

