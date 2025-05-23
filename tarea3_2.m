clc; clear; close all;

a = [1, -5, 5, -1];

x0 = 0.8;

max_iter = 10;

fprintf('f(x) = x^3 - 5x^2 + 5x - 1\n\n');
fprintf('  I  x           b3        b2        b1        b0        c2        c1\n');

for k = 1:max_iter
    b = zeros(1, length(a));
    c = zeros(1, length(a) - 1);

    b(1) = a(1);
    for i = 2:length(a)
        b(i) = a(i) + b(i-1) * x0;
    end
    
    c(1) = b(1);
    for i = 2:length(b) - 1
        c(i) = b(i) + c(i-1) * x0;
    end

    x1 = x0 - b(end) / c(end);

    fprintf('%3d  %8.6f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f\n', ...
            k, x0, b(1), b(2), b(3), b(4), c(1), c(2));

    if abs(x1 - x0) < 1e-6
        break;
    end

    x0 = x1;
end

root1 = x1;
fprintf('\nRaíz aproximada encontrada: x = %.6f\n', root1);

b_quadratic = [b(2), b(3), b(4)];
b_quadratic = floor(b_quadratic * 1e4) / 1e4;  

fprintf('\nPolinomio cuadrático resultante: x^2 + (%.4f)x + (%.4f) = 0\n', b_quadratic(1), b_quadratic(2));

a_quad = 1; 
b_quad = b_quadratic(1);
c_quad = b_quadratic(2);

discriminant = b_quad^2 - 4*a_quad*c_quad;

if discriminant < 0
    fprintf('\nLas raíces restantes son complejas.\n');
    real_part = -b_quad / (2*a_quad);
    imag_part = sqrt(abs(discriminant)) / (2*a_quad);
    fprintf('x2 = %.4f + %.4fi\n', real_part, imag_part);
    fprintf('x3 = %.4f - %.4fi\n', real_part, imag_part);
else
    x2 = (-b_quad + sqrt(discriminant)) / (2*a_quad);
    x3 = (-b_quad - sqrt(discriminant)) / (2*a_quad);
    fprintf('\nRaíces restantes:\n');
    fprintf('x2 = %.6f\n', x2);
    fprintf('x3 = %.6f\n', x3);
end
