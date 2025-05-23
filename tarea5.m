clc;
clear;

funciones = {
    @(x) 2*cos(2*x), 0, pi/4, 'f(x) = 2cos(2x) en [0, pi/4]';
    @(x) -x.^2 - x/2 + 4, 0.5, 1.5, 'f(x) = -x^2 - x/2 + 4 en [0.5, 1.5]';
    @(x) exp(-x.^2), 0, 1, 'f(x) = e^{-x^2} en [0, 1]'
};

simpson13 = @(f, a, b, n) ...
    (mod(n, 2) == 0) * ...
    ( (b - a)/(3*n) ) * ...
    ( f(a) + ...
      4*sum(arrayfun(f, a + (1:2:n-1)*(b - a)/n)) + ...
      2*sum(arrayfun(f, a + (2:2:n-2)*(b - a)/n)) + ...
      f(b) ); %se salia de la pantalla xd

n = 6; 

fprintf('Método de Simpson 1/3 con n = %d subintervalos\n\n', n);

for i = 1:size(funciones, 1)
    f = funciones{i, 1};
    a = funciones{i, 2};
    b = funciones{i, 3};
    descripcion = funciones{i, 4};
    
    resultado = simpson13(f, a, b, n);
    
    fprintf('%s\n', descripcion);
    fprintf('  Integral aproximada: %.8f\n\n', resultado);
end
