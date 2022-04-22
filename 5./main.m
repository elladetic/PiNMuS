load kreditni_razredi_A.mat;

format long e;

x_0 = [1; 0; 0; 0; 0; 0; 0; 0;];
tol = 1e-5;

[x_k, ro_k, k, residuals] = metoda_potencija(A, x_0, tol); 
%potrebno je 570 iteracija
[v, ro] = eig(A);
ro(2,2) / ro(1,1) %kvocijent je 9.881777662659132e-01

plot(log(residuals));  %norme reziduala u log skali