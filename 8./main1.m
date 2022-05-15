n = 4;
N = 16;
xk = zeros(N,1);

for j = 0 : (N - 1) 
    xk(j + 1) = (2 * pi * j) / N;   
end

fk_1 = zeros(N, 1); 
fk_2 = zeros(N, 1); 

for j = 0 : (N - 1)
    fk_1(j + 1) = exp(-xk(j + 1)^2 / 4);
    fk_2(j + 1) = abs((xk(j + 1) - pi) / pi);
    
end

%primjena FFT algoritma;
coef_1 = FFT(fk_1, n);
coef_2 = FFT(fk_2, n);

%primjena trig_FFT algoritma;
[A_1, B_1] = trig_FFT(fk_1, n);
[A_2, B_2] = trig_FFT(fk_2, n);

%Hornerova schema;
yk_1 = zeros(N,1);
yk_2 = zeros(N,1);

for j = 0 : (N - 1)
    yk_1(j + 1) = fazni_Horner(xk(j + 1), coef_1);
    yk_2(j + 1) = fazni_Horner(xk(j + 1), coef_2);  
end


%greška
e_1 = max(abs(fk_1 - yk_1));
e_2 = max(abs(fk_2 - yk_2));

%crtanje
%prva funkacija
figure(1)
fplot(@(x) exp(-x^2 / 4), [0,6],'b')
hold on
plot(xk, fk_1, 'ro')
hold off

%crtanje - druga funkcija
figure(2)
fplot(@(x) abs((x - pi) / pi), [0,6],'b')
hold on
plot(xk, fk_2, 'ro')
hold off

%crtanje trigonometrijski interpolacijski polinom
x = linspace(0,2 * pi, 201);
psi_1 = zeros(201,1);
psi_2 = zeros(201,1);

for k = 1 : 201
    psi_1(k) = trig_pol(x(k),N,A_1,B_1);
    psi_2(k) = trig_pol(x(k),N, A_2, B_2);
end


%prva funkcija
figure(3)
fplot(@(x) exp(-x^2 / 4), [0,2 * pi],'b')
hold on
plot(x, psi_1, 'r')
hold off


%druga funkcija
figure(4)
fplot(@(x) abs((x - pi) / pi), [0,2 * pi],'b')
hold on
plot(x, psi_2, 'r')
hold off


%vidimo odstupanje u rubovima
%problem je u tome sto funkcija nije periodicna 
%Fourier se dobro ponaša za periodične funkcije!

