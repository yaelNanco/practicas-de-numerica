x_data = [1 2 3 5 7];
y_data = [3 6 19 99 291];

n = length(x_data);

div_diff = zeros(n, n);
div_diff(:,1) = y_data';

for j = 2:n
    for i = 1:(n-j+1)
        div_diff(i,j) = (div_diff(i+1,j-1) - div_diff(i,j-1)) / (x_data(i+j-1) - x_data(i));
    end
end

syms x
newton_poly = div_diff(1,1);
prod_term = 1;

for j = 1:n-1
    prod_term = prod_term * (x - x_data(j));
    newton_poly = newton_poly + div_diff(1,j+1) * prod_term;
end

P4_func = matlabFunction(newton_poly);

x_vals = linspace(1, 7, 300);
y_vals = P4_func(x_vals);

figure
plot(x_vals, y_vals, 'b-', 'LineWidth', 2)                
hold on
plot(x_data, y_data, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r')  
grid on
xlabel('x')
ylabel('f(x)')
title('Interpolación de Newton - Polinomio de grado 4')
legend('Polinomio interpolado', 'Puntos conocidos', 'Location', 'northwest')
