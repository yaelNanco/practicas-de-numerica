function main() %nanco

    N = input('Introduce un número entero N: ');
    
    disp('Matriz con múltiplos en filas:');
    M_fila = multiplos_fila(N); 
    disp(M_fila);
    
    disp('Matriz con múltiplos en columnas:');
    M_columna = multiplos_columna(N); 
    disp(M_columna);
    
end