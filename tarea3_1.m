clc; clear; close all;

f = @(x) 2*x.*cos(2*x) - (x+1).^2;

a = -3;
b = -2;

max_iter = 5;

fprintf('I    |    a    |    b    |   f(a)   |   f(b)   |    x1    |   f(x1)  |   Er (%%)  \n');

x_prev = a;
for i = 1:max_iter
    x1 = (a*f(b) - b*f(a)) / (f(b) - f(a));
    fx1 = f(x1);
    
    if i == 1
        Er = NaN; 
    else
        Er = abs((x1 - x_prev) / x1) * 100;
    end
    
    fprintf('%2d   | %7.4f | %7.4f | %8.4f | %8.4f | %8.4f | %8.4f | %8.4f\n', i, a, b, f(a), f(b), x1, fx1, Er);
    
    if f(a) * fx1 < 0
        b = x1;
    else
        a = x1;
    end
    
    x_prev = x1;
end

gx = linspace(-3.5, -1.5, 1000);
gy = f(gx);
figure;
plot(gx, gy, 'b', 'LineWidth', 2); hold on;
plot(x1, f(x1), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
grid on;
xlabel('x'); ylabel('f(x) o Y');
legend('f(x)', '(casi la raiz)');
