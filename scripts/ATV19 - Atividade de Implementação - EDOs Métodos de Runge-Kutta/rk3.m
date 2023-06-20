function I = rk3(h, t_end)
    L = 50e-3;  % indutância em Henry
    R = 20;     % resistência em Ohm
    E = 10;     % fonte em Volt

    I = zeros(1, t_end/h);
    I(1) = 0;

    for t = 2:t_end/h
        k1 = h*(E - R*I(t-1))/L;
        k2 = h*(E - R*(I(t-1) + k1/2))/L;
        k3 = h*(E - R*(I(t-1) - k1 + 2*k2))/L;
        I(t) = I(t-1) + (1/6)*(k1 + 4*k2 + k3);
    end
end
