% Dados
t_data = [1955 1960 1965 1970] - 1950;
p_data = [2780 3040 3350 3710];

% Estimativa de kg
kg_estimates = log(p_data/p_data(1))./t_data;
kg = mean(kg_estimates);
disp('Estimativa de kg:')
disp(num2str(kg))

% Função para simular com RK4
function dpdt = population_growth(t, p, kg)
  dpdt = kg*p;
endfunction

% Simulação de 1950 a 2050
t0 = 0; tf = 100; y0 = 2560; % y0 é a população em 1950
t = t0:5:tf; h = 5; % passo de tamanho 5 anos
y_rk4 = zeros(1, length(t));
y_rk4(1) = y0;
for i = 1:(length(t)-1)
  k1 = h*population_growth(t(i), y_rk4(i), kg);
  k2 = h*population_growth(t(i)+h/2, y_rk4(i)+k1/2, kg);
  k3 = h*population_growth(t(i)+h/2, y_rk4(i)+k2/2, kg);
  k4 = h*population_growth(t(i)+h, y_rk4(i)+k3, kg);
  y_rk4(i+1) = y_rk4(i) + (k1+2*k2+2*k3+k4)/6;
end
disp('Resultados da Simulação com RK4:')
disp(y_rk4)

% Gráfico
figure
hold on
plot([1950 t_data+1950], [2560 p_data], 'ro')
plot(t+1950, y_rk4, 'b-')
xlabel('Ano')
ylabel('População (milhões)')
legend('Dados', 'Simulação RK4')
hold off
