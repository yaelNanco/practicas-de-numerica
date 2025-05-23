function resolver_sistemas()

    sistemas = {
        {[4 -2 1; -2 4 -2; 1 -2 4], [11; -16; 17]},
        {[1 1 1; 1 2 5; 1 4 25], [6; 12; 36]},
        {[1 2 1; 3 8 1; 0 4 1], [2; 12; 2]}
    };

    for i = 1:length(sistemas)
        fprintf('Sistema %d:\n', i);
        A = sistemas{i}{1};
        b = sistemas{i}{2};
        
        x_linsolve = linsolve(A, b);
        fprintf('Solución con linsolve:\n');
        disp(x_linsolve);
        
         A_inv = inv(A);
        x_inv = A_inv * b;
        fprintf('Solución con matriz inversa:\n');
        disp(x_inv);
        
        D = det(A);
        Dx = det([b A(:,2:3)]);
        Dy = det([A(:,1) b A(:,3)]);
        Dz = det([A(:,1:2) b]);
        x_cramer = [Dx/D; Dy/D; Dz/D];
        fprintf('Solución con regla de Cramer:\n');
        disp(x_cramer);
        
        [L, U] = doolittle(A);
        fprintf('Matriz L:\n');
        disp(L);
        fprintf('Matriz U:\n');
        disp(U);
        fprintf('\n');
    end
end

function [L, U] = doolittle(A)
    n = size(A,1);
    L = eye(n);
    U = zeros(n);
    
    for i = 1:n
        for j = i:n
            U(i,j) = A(i,j) - L(i,1:i-1) * U(1:i-1,j);
        end
        for j = i+1:n
            L(j,i) = (A(j,i) - L(j,1:i-1) * U(1:i-1,i)) / U(i,i);
        end
    end
end