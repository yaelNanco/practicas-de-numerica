clc; clear;

A = [1 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 -10];  %% aceptemelo profe, pense que era para hoy xdxd
b = [7.85; 19.3; 71.4];

n_iter = 3;

x_jacobi = zeros(3,1);
x_gs = zeros(3,1);

D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);

for k = 1:n_iter
    x_jacobi = D\(b - (L+U)*x_jacobi);
    fprintf('Jacobi Iter %d: x = %.4f, y = %.4f, z = %.4f\n', k, x_jacobi);
end

for k = 1:n_iter
    x_gs = (D+L)\(b - U*x_gs);
    fprintf('Gauss-Seidel Iter %d: x = %.4f, y = %.4f, z = %.4f\n', k, x_gs);
end
