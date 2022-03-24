%random isprobavanje 
A_proba =  [2 1 -1; -3 -1 2; -2 1 2];
b_proba =  [8;-11;-3];
%ovo radi skroz okej, rjesenje je 2 3 -1 

%onaj zadnji zadatak s primjenom 
load('podaci.txt');
x0 = [1;1;1;1;1;1;1;1;1;1;1;1;1];
x1 = podaci(:,1); %težina
x2 = podaci(:,2); %dob
y = podaci(:,3); %izmjereni krvi tlak

%ona stvar s oznakama mutava
b=y;
A = [x0, x1,x2];
%usporedba QR faktorizacije

%Householderovi 
[Q_h,R_h] = qr(A);
A_h = Q_h * R_h;
r_h = norm(A_h' * (b- y), 2); %jel mi je Ax y? valjda je..?

%Givensove
[Q_g,R_g,x] = MNKgivens(A, b);
A_g = Q_g * R_g;
r_g = norm(A_g' * (b- y), 2);

if(r_h < r_g)
    disp("Householderovi reflektori su bolji!!");
else
    disp("Givensove rotacije su bolje!!");
end

%uu x-u, odnosno b su moji koeficijenti
%da dobim predikcije koristim Ax
