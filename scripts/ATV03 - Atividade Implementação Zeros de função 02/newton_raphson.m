# Definição da função e sua derivada
f = @(x) x^10 - 1;
df = @(x) 10*x^9;

# Definição dos parâmetros iniciais
X0 = 0.5;
sigma = 0.0001;
N = 100;
i = 1;

# Impressão do cabeçalho da tabela
fprintf("Iteração\tXr\t\tf(Xr)\t\tErro aprx.\tErro verd.\n");

# Iterações do método de Newton-Raphson
while i <= N
    # Cálculo da aproximação e do erro
    Xr = X0 - f(X0)/df(X0);
    erro_aproximado = abs(Xr - X0);
    erro_verdadeiro = abs(Xr - r); # onde r é a raiz exata da função
    
    # Impressão dos resultados
    fprintf("%d\t\t%.8f\t%.8f\t%.8f\t%.8f\n", i, Xr, f(Xr), erro_aproximado, erro_verdadeiro);
    
    # Verificação do critério de parada
    if erro_aproximado < sigma
        fprintf("O método convergiu para Xr = %.8f\n", Xr);
        break;
    end
    
    # Atualização dos valores
    X0 = Xr;
    i = i + 1;
end

# Verificação de convergência
if i > N
    fprintf("O método não convergiu após %d iterações.\n", N);
end
