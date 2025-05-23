function M = multiplos_fila(N)

N = input('Introduce un número entero N: ');

if N < 0
    
  disp('error. es un numero negativo');
  return;

end

if mod(N,1) ~= 0
   
    disp('error. el numero no es entero');
    return;
    
end

v = randi([1, 9], 1, N);
M = zeros(N, N);

for j = 1:N
    
    multiplos = v(j) * (1:N);
    multiplos = mod(multiplos - 1, 9) + 1;
    M(:, j) = multiplos';
end

disp(v);
disp(M);

end