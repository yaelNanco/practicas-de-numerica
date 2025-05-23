x = linspace(-2*pi, 2*pi, 100);

y1 = x.^2 - 4*x + 3;    
y2 = sin(x);            
y3 = exp(-0.5*x);         

figure;
hold on; 
plot(x, y1, 'r--o', 'LineWidth', 1.5, 'MarkerSize', 5); 
plot(x, y2, 'b-*', 'LineWidth', 1.5, 'MarkerSize', 5);  
plot(x, y3, 'g-.s', 'LineWidth', 1.5, 'MarkerSize', 5);

xlabel('Eje X');
ylabel('Eje Y');
title('Gráfica de tres funciones matemáticas');
grid on; 

legend('x^2 - 4x + 3', 'sin(x)', 'e^{-0.5x}', 'Location', 'best');

hold off; 
