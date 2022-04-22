
format long e;

%kreiranje bidijagonalne matrice
n = 100;
value = 1/2;
A = diag(value *ones(1,n)) + diag(ones(1,n-1),1);

%računanje QRa
[Q, R, P] = qr(A);
%diag(R) provjera dijagonalnih elementa od R
plot(diag(R),'c*'); %samo zadnji element je jako mali!!;

%računanje svd-a
[U,S,V] = svd(A);
%semilogy(diag(S), "c*");
%diag(S) provjera singularnih vrijednosti

x = transpose(1:1:100);
b = A * x;
x_solution = R \ (Q' * b);
x_solution = P * x_solution ;


%rješavanje problema najmanjih kvadrata koristeći potpuno ortogonalnu
%dekompoziciju
 %A je 100 x 100, rank je 99
R(100,100) = 0;
R11 = R(1:99, 1:99);
R12 = R(1:99, 100);
R_krnja = [R11'; R12'];

[Z, L] = qr(R_krnja); %vidjeli smo gore da je samo zadnji element jako mali

L11 = L(1:99, 1:99)';
L = transpose(L(1:99,:)); %transpose jer je donje trokutasta
S = P * Z; %ovdje Z transponirano al nisam ni gore pa nemoram transponirat sad

tmp = [L11 \ Q(:,1:99)'*b; 0];
x_nk  = S * tmp;

%relativne greske - usporedba s MNK ranga
rel_greska1 = norm(x-x_solution,2) / norm(x,2)
rel_greska2 = norm(x-x_nk,2) / norm(x,2)

%sad gledam matrice R, njihove uvjetovanosti

cond(R,2) %inf
cond(R_krnja, 2) %ovo je 3
%velike razlike u uvjetovanosti
%male svojstvene vrijednost -> ponašamo se kao da nije punog ranga






