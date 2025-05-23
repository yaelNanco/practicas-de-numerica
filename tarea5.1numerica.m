clc;
clear;

f = @(x) -x.^2 - x/2 + 4;

x0 = 0;

h_vals = [0.2, 0.1];

f_deriv_exacta = -0.5;

fprintf('Métodos de diferenciación numérica en x = 0 para f(x) = -x^2 - x/2 + 4\n');
fprintf('Derivada exacta: f''(0) = %.4f\n\n', f_deriv_exacta);

for i = 1:length(h_vals)
    h = h_vals(i);
    
    f_forward = (-3*f(x0) + 4*f(x0 + h) - f(x0 + 2*h)) / (2*h);
    
    f_backward = (3*f(x0) - 4*f(x0 - h) + f(x0 - 2*h)) / (2*h);
    
    f_centrada = (f(x0 + h) - f(x0 - h)) / (2*h);
    
    fprintf('Con h = %.2f\n', h);
    fprintf('  Hacia adelante: %.6f | Error: %.2e\n', f_forward, abs(f_forward - f_deriv_exacta));
    fprintf('  Hacia atrás   : %.6f | Error: %.2e\n', f_backward, abs(f_backward - f_deriv_exacta));
    fprintf('  Centrada      : %.6f | Error: %.2e\n\n', f_centrada, abs(f_centrada - f_deriv_exacta));
end
