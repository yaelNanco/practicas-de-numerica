x_data = [2 3 5];
y_data = [6 19 99];

syms x

L0 = ((x - x_data(2))*(x - x_data(3))) / ((x_data(1) - x_data(2))*(x_data(1) - x_data(3)));
L1 = ((x - x_data(1))*(x - x_data(3))) / ((x_data(2) - x_data(1))*(x_data(2) - x_data(3)));
L2 = ((x - x_data(1))*(x - x_data(2))) / ((x_data(3) - x_data(1))*(x_data(3) - x_data(2)));

P2 = y_data(1)*L0 + y_data(2)*L1 + y_data(3)*L2;

P2_func = matlabFunction(P2);

x_vals = linspace(2, 5, 200);
y_vals = P2_func(x_vals);

figure
plot(x_vals, y_vals, 'b-', 'LineWidth', 2) 
hold on
plot(x_data, y_data, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r')
grid on
xlabel('x')
ylabel('f(x)')
title('Interpolación Cuadrática - Polinomio de Lagrange')
legend('Polinomio interpolado', 'Puntos conocidos', 'Location', 'northwest')
