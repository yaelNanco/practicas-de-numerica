function main() %nanco

    N = input('Introduce un n�mero entero N: ');
    
    disp('Matriz con m�ltiplos en filas:');
    M_fila = multiplos_fila(N); 
    disp(M_fila);
    
    disp('Matriz con m�ltiplos en columnas:');
    M_columna = multiplos_columna(N); 
    disp(M_columna);
    
end