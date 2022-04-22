load kreditni_razredi_A.mat;

format long e;

x_0 = [1; 0; 0; 0; 0; 0; 0; 0;];
mi = 1.001;
tol = 1e-5;

[x_k, ro_k, k, residuals] = inverzne_iteracije(A, x_0, mi, tol); 
%potrebne su 3 iteracija
[v, ro] = eig(A);
abs(ro(1,1) - mi) / abs(ro(2,2)  - mi)%kvocijent je 7.798953136702606e-02
plot(log(residuals));  %norme reziduala u log skali

%funkcija svi_svoj_parovi

tol = 1e-8;
[l, S, g, kS] = svi_svoj_parovi(A, x_0, tol);