x = 2;  % Valor de x
h = 0.1;  % Valor de h

% Aproximação da primeira derivada usando O(h^2)
approx_first_order_2 = (exp(x + h) - exp(x - h)) / (2*h);

% Aproximação da primeira derivada usando O(h^4)
approx_first_order_4 = (exp(x - 2*h) - 8*exp(x - h) + 8*exp(x + h) - exp(x + 2*h)) / (12*h);

% Aproximação da segunda derivada usando O(h^2)
approx_second_order_2 = (exp(x + h) - 2*exp(x) + exp(x - h)) / (h^2);

% Aproximação da segunda derivada usando O(h^4)
approx_second_order_4 = (-exp(x + 2*h) + 16*exp(x + h) - 30*exp(x) + 16*exp(x - h) - exp(x - 2*h)) / (12*h^2);

fprintf('Aproximação da primeira derivada usando O(h^2): %.6f\n', approx_first_order_2);
fprintf('Aproximação da primeira derivada usando O(h^4): %.6f\n\n', approx_first_order_4);

fprintf('Aproximação da segunda derivada usando O(h^2): %.6f\n', approx_second_order_2);
fprintf('Aproximação da segunda derivada usando O(h^4): %.6f\n', approx_second_order_4);
