data = [0.90 1.42 1.30 1.55 1.63 1.32 1.35 1.47 1.95 1.66 1.96 1.47 1.92 1.35 1.05 1.85 1.74 1.65 1.78 1.71 2.29 1.82 2.06 2.14 1.27];

% (a) Média
mean_val = mean(data);

% (b) Mediana
median_val = median(data);

% (c) Moda
mode_val = mode(data);

% (d) Amplitude
range_val = range(data);

% (e) Desvio padrão
std_dev = std(data);

% (f) Variância
variance = var(data);

% (g) Coeficiente de variação (em porcentagem)
cv = std_dev / mean_val * 100;

% Exibindo os resultados
printf("Média: %f\n", mean_val);
printf("Mediana: %f\n", median_val);
printf("Moda: %f\n", mode_val);
printf("Amplitude: %f\n", range_val);
printf("Desvio padrão: %f\n", std_dev);
printf("Variância: %f\n", variance);
printf("Coeficiente de variação: %f%%\n", cv);

% (h) Histograma
hist(data, [0.8:0.2:2.4]);
title("Histograma");
xlabel("Valores");
ylabel("Frequência");
