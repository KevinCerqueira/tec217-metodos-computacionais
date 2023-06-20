function main()
    h = 0.0001;
    t_end = 0.02;
    t = 0:h:h*floor(t_end/h); % Use floor to make sure length matches with current vectors
    
    I_rk2 = rk2(h, t_end);
    I_rk3 = rk3(h, t_end);
    I_rk4 = rk4(h, t_end);
    

    disp('Resultados:')
    disp(['RK 2a ordem (Ralston): ', num2str(I_rk2(end))])
    disp(['RK 3a ordem: ', num2str(I_rk3(end))])
    disp(['RK 4a ordem: ', num2str(I_rk4(end))])
end

main()
