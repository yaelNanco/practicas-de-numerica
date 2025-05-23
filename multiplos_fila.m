function M = multiplos_fila(N)

disp('ingrese un numero entero y positivo');
N = input('numero: ');

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

i = 1;
while i <= N

    M(i, :) = v(i) * (1:N);
    i = i + 1;

end

disp(v);
disp(M);

end
