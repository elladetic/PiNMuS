
%učitavanje podataka
load primjer_osjetljivosti_pnk_Ax.mat;
%svd
[U,S,V] = svd(A);
r = rank(A); %121
size(A); %150 x 121
n = size(x,1);

%uvjetovanost
cond_A = cond(A); %2.924132758112890e+09

%crtanje svojstvenih vrijednosti
semilogy(diag(S), "c*");
%ovdje isto mogu vidjet da je punog randa jer je najmanja singularna
%vrijednost reda velicine 10 ^(-2)
%veliki raspon svojstvenih vrijednosti

b = A * x; %ovdje mi nije sve baš 10000 ?
size(b); %ovo je 150 x 1
eta = randn(size(b,1), 1);
b_new = b + eta; %greške su tek u petoj znamenci

%rjesenje metode najmanjih kvadrata SVDom
[U_,S_,V_] = svd(A,"econ"); %ponovo rješavam isti problem

for (i=1:n)
    S_(i,i) = 1 / S_(i,i);
end

x_nk = V_ * S_ * U_' * b_new; %ovo je velika norma!
  
norm(A*x-b,2); 
norm(A*x_nk-b_new,2);

norm(x-x_nk, 2) 


plot(1:121, x, 1:121, x_nk) %mogu i plot pa hold pa plot
legend("x-potez", "x_nk")
%plot(x, x_nk)

%x_nk jako los, matrica je lose uvjetovana -> najmanja singularna
%vrijednost je jako mala 






