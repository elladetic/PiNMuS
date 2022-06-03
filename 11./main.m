format long e

%definicija funkcija;
fx = @(x)(x(1)^2+x(2)^2-2)^2+(exp(x(1)-1)+x(2)^3-2)^2;
dfx = @(x) [4*x(1)*(x(1)^2+x(2)^2-2)+2*exp(x(1)-1)*(exp(x(1)-1)+x(2)^3-2);4*x(2)*(x(1)^2+x(2)^2-2)+6*x(2)^2*(exp(x(1)-1)+x(2)^3-2)];
d2fx = @(x) [4*(x(1)^2+x(2)^2-2)+8*x(1)^2+2*exp(2*x(1)-2)+2*exp(x(1)-1)*(exp(x(1)-1)+x(2)^3-2) 8*x(1)*x(2)+6*exp(x(1)-1)*x(2)^2;8*x(1)*x(2)+6*x(2)^2*exp(x(1)-1) 4*(x(1)^2+x(2)^2-2)+8*x(2)^2+12*x(2)*(exp(x(1)-1)+x(2)^3-2)+18*x(2)^4];

N=100;
x0=[0.5; 0.4];

dim=2;
epsilon=1e-10;
del=1e-10;

%usporedba metoda
[x_N,k_N,X_N,FX_N,mi_N,llam_N,klam_N] = glob_mod_Newton_minim(fx,dfx,d2fx,x0,dim,epsilon,del,N);
[x_S,k_S,X_S,FX_S,llam_S,klam_S] =glob_sekanta_minim(fx,dfx,x0,dim,epsilon,del,N);

%Newtonova konvergira brže
x_N 
x_S
k_N %9 iteracija
k_S %50 iteracija


figure(1)
plot(llam_N, "ro")

figure(2)
plot(llam_S, "ro")

figure(3)
plot(FX_N)

figure(4)
plot(FX_S)
