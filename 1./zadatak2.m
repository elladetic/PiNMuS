A_2 = [1e8 0 2e4 -3e4; 0 484 -11 22; 2e4 -11 4.2501 -6.44;-3e4 22 -6.44 47];
b_2 = [9.999e7; 495; 19986.8101; -29937.44];

R=chol(A_2);
opts.LT = true;
y = linsolve(R', b_2);

opts.LT = false;
opts.UT = true;
x = linsolve(R, y);

relativna_greska_2 = norm(x - [1;1;1;1], 2) / norm([1;1;1;1], 2);
ocjena_2 = 32 * (eps/2) * cond(A_2, 'fro')/ (1- 32 * (eps/2) * cond(A_2, 'fro'));