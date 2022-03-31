

%random isprobavanje 
A_proba =  [2 1 -1; -3 -1 2; -2 1 2];
b_proba =  [8;-11;-3];
%ovo radi skroz okej, rjesenje je 2 3 -1 

format long e;

%onaj zadnji zadatak s primjenom 
load('podaci.txt');
x0 = [1;1;1;1;1;1;1;1;1;1;1;1;1];
x1 = podaci(:,1); %težina
x2 = podaci(:,2); %dob
y = podaci(:,3); %izmjereni krvi tlak

%ona stvar s oznakama 
b=y;
A = [x0, x1,x2];
[m,n] = size(A);
%usporedba QR faktorizacije

%Householderovi 
[Q_h,R_h] = qr(A, 0);
x_holder = R_h \ (Q_h.'*b);
residual_householder = norm(A' * (b- A * x_holder), 2);

%Givens
x = MNKgivens(A, b);
residual_givens = norm(A' * (b- A * x), 2);


if(residual_householder < residual_givens)
    disp("Householderovi reflektori su bolji!!");
else
    disp("Givensove rotacije su bolje!!");
end

%uu x-u, odnosno b su moji koeficijenti
%da dobim predikcije koristim Ax
