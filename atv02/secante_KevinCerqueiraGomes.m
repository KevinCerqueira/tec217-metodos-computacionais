# Definição da função
f = @(x) x - 2*sin(x) - sqrt(2);

# Definição dos parâmetros iniciais
X0 = 1.8;
X1 = 2;
sigma = 0.0001;
N = 100;
i = 1;

# Impressão do cabeçalho da tabela
fprintf("Iteração\tXr\t\tf(Xr)\t\tErro aprx.\tErro verd.\n");

# Iterações do método da Secante
while i <= N
    # Cálculo da aproximação e do erro
    Xr = X1 - (f(X1)*(X1 - X0))/(f(X1) - f(X0));
    erro_aproximado = abs(Xr - X1);
    erro_verdadeiro = abs(Xr - 1.89378915); # onde 1.89378915 é a raiz exata da função
    
    # Impressão dos resultados
    fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\n", i, Xr, f(Xr), erro_aproximado, erro_verdadeiro);
    
    # Verificação do critério de parada
    if erro_aproximado < sigma
        fprintf("O método convergiu para Xr = %.8f\n", Xr);
        break;
    end
    
    # Atualização dos valores
    X0 = X1;
    X1 = Xr;
    i = i + 1;
end

# Verificação de convergência
if i > N
    fprintf("O método não convergiu após %d iterações.\n", N);
end
