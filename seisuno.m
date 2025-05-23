x0 = 3;
f0 = 19;

x1 = 5;
f1 = 99;

x = 4;

f_x = f0 + (f1 - f0) / (x1 - x0) * (x - x0);

fprintf('estimacion: %.2f\n',f_x);
