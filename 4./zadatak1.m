
format long;

%kreiranje bidijagonalne matrice
n = 100;
value = 1/2;
A = diag(value *ones(1,n)) + diag(ones(1,n-1),1);

%računanje QRa
[Q,R, P] = qr(A);

%računanje svd-a
[U,S,V] = svd(A);

x = transpose(1:1:100);
b = A * x;
x_solution =   inv(transpose(P)) * inv(R) * inv(Q) * b(1:n);
%ovo izgleda okej osim prvih par lol al kak da izbjegnem ove inverze
%opcenito??;

%rješavanje problema najmanjih kvadrata koristeći potpuno ortogonalnu
%dekompoziciju
plot(diag(R),'c*'); %samo zadnji element je jako mali!!;
r = rank(A);  %A je 100 x 100, rank je 99

[Z, L] = qr(R(1:99, :)');
%size(L) je 100 x 99, a želim da bude 99 x 99
%Z je 100 x 100
L = transpose(L(1:99,:)); %transpose jer je donje trokutasta
S = P * Z;

tmp1 = transpose(Q(:,1:r)) * b;

opts.LT=true;
tmp2 = linsolve(L,tmp1,opts);

%opts.LT=false;
%pom = L\v;

tmp2(100,1) = 0; %to je onaj zadnji kojeg stavljam na 0 eksplicitno;
x_final_solution = S * tmp2; %na kraju množim sve sa S


%usporedba s MNK punog ranga
[Q_fullrank, R_fullrank] = qr (A,0);
opts.UT = true 
x_solution_full_rank = linsolve(R_fullrank, transpose(Q_fullrank) * b);
opts.UT = false
%sad gledam matrice R, njihove uvjetovanosti


cond(R,2); %9.777787936967692e+18
cond(R); %2.535025025309796e+30
%velike razlike u uvjetovanosti

%uvjetovanosti krnjih verzija matrica
cond(R(1:99,1:99),2); %2.996715084073926
cond(R_fullrank(1:99,1:99),2); %1.267509718450060e+30
%ovdje je najveća razlika prakticki

norm(A*x_final_solution-b,2); %3.719689206972206e-13
norm(A*x_solution_full_rank-b,2); %0 
%nema velikih razlika u greškama




