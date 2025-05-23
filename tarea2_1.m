clc; clear;

f = @(x) 2*x.*cos(2*x) - (x+1).^2;

a = -3;
b = -2;

num_iter = 5;

fprintf('\nIteración\t  a\t     b\t     x_i\t   f(x_i)\t  Error Relativo \n');
fprintf('------------------------------------------------------------\n');

x_prev = NaN; 

for i = 1:num_iter
 
    xi = (a + b) / 2;
    f_xi = f(xi);
    
    if f(a) * f_xi < 0
        b = xi;
    else
        a = xi;
    end
    
    if i == 1
        er = NaN;
    else
        er = abs((xi - x_prev) / xi) * 100;
    end
    
    fprintf('%4d \t %.4f \t %.4f \t %.4f \t %.4f \t %.4f\n', i, a, b, xi, f_xi, er);
    
    x_prev = xi;
end

gx = linspace(-3.5, -1.5, 1000);
fy = f(gx);
figure;
plot(gx, fy, 'b', 'LineWidth', 1.5); hold on;
plot(xi, f(xi), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

grid on;
xlabel('x');
ylabel('f(x)');
title('Estimación de la Raíz');
legend('f(x)', 'Raíz Estimada');
