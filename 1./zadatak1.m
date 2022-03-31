A = [1e-10 2 -3 300; 2 -2 100 1e5; -111 1 0 -1; 2222 4 -1 -1];
b = [299; 100100; -111; 2224];

A_ = lufac(A, size(A,1));
x_1 = luslv(A_, b, size(A,1));

relativna_greska_bez_pivotiranja = norm(x_1 - [1;1;1;1], 2) / norm([1;1;1;1], 2);
ocjena_bez_pivotiranja = 64 * eps/2 * (max(max(abs(triu(A_)))) / max(max(abs(A)))) * cond(A,'fro') /(1-64 * (max(max(abs(triu(A_)))) / max(max(abs(A)))) * eps/2);

[L,U,P] = lu(A);
x_2 = linsolve(A, b);

relativna_greska_sa_pivotiranjem = norm(x_2 - [1;1;1;1], 2) / norm([1;1;1;1], 2);
ocjena_sa_pivotiranjem = 64 * eps/2 * (max(max(abs(U))) / max(max(abs(A)))) * cond(A, 'fro') /(1-64 * (max(max(abs(U))) / max(max(abs(A)))) * eps/2 * cond(A, 'fro'));


