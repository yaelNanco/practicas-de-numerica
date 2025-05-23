clc; clear; close all;

f = @(x) 8*x.*sin(x).*exp(-x) - 1;
df = @(x) 8*exp(-x) .* (sin(x) .* (1 - x) + x .* cos(x));

x0 = 0.3; 
num_iter = 5;
tolerance = 1e-4;

fprintf(' Iter |    x_i    |   Error Relativo \n');
fprintf('--------------------------------------\n');

x_i = x0;
for i = 1:num_iter
    x_next = x_i - f(x_i) / df(x_i);  
    error_rel = abs((x_next - x_i) / x_next) * 100; 
  
    fprintf('  %2d  |  %.4f  |     %.4f \n', i-1, x_i, error_rel);
    
    x_i = x_next;
    
    if error_rel < tolerance
        break;
    end
end

fprintf('--------------------------------------\n');
fprintf('Raíz estimada después de %d iteraciones: %.4f\n', i, x_i);

x_vals = linspace(0, 1, 100); 
y_vals = f(x_vals);

figure;
plot(x_vals, y_vals, 'b', 'LineWidth', 2); hold on;
plot(x_i, f(x_i), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 
yline(0, 'k--'); 
xlabel('x');
ylabel('f(x)');
title('Método de Newton-Raphson');
legend('f(x)', 'Raíz estimada');
grid on;

