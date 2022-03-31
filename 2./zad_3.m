%rješavamo konkretni sustav

A=[16 -4 8 12; -4 4 -7 3;8 -7 78 32;12 3 32 113];
b=[32; -4; 111; 160];
tol=1e-8;
%zadani parametri

optim=sor_konvergencija(A); 
%prvo crtamo graf spektralnih matrica i dobivamo opt omega

x0=[0;0;0;0];
[xk1,k1,v1]=sor(A,b,x0,tol,1); %gauss

[xk2,k2,v2]=sor(A,b,x0,tol,optim);
k1
k2
%provjera brzine konvergencije
% k_1(28) > k_2(17)  -> brža je druga, odnosno sor s optimalnim omega

%sada mi trebaju reziduali -> ovo vrti malo duže
semilogy(v1,'green');
hold on;
semilogy(v2,'yellow');
hold off;