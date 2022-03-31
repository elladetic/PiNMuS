
%učitavanje podataka
load primjer_osjetljivosti_pnk_Ax.mat;
%svd
[U,S,V] = svd(A);
r = rank(A); %121
size(A); %150 x 121
%uvjetovanost
cond_A = cond(A); %2.924132758112890e+09
%crtanje svojstvenih vrijednosti
semilogy(diag(S), "c*");
%ovdje isto mogu vidjet da je punog randa jer je najmanja singularna
%vrijednost reda velicine 10 ^(-2)

b = A * x; %ovdje mi nije sve baš 10000 ?
size(b); %ovo je 150 x 1
eta = rand(size(b,1));
b_new = b + eta;

[U_,S_,V_] = svd(A,"econ");
x_nk = transpose(V_) * S_ \ transpose(U_) * b_new; %nez jel ovo okej
  
norm(A*x-b,2);
norm(A*x_nk-b,2);

plot(x);
plot(x_nk);

