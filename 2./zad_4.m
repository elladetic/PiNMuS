n = 100; %velicina matrice
M = zeros(100,100);

for i = 1:100
    M(i,i) = i*i; %svojstvene vrijednosti su mi kvadrati zapravo
end

X = rand(100);
[Q,R] = qr(X); %generiram random Q
A = Q*M*(Q.'); %ovako dobijem matricu A   

x_0 = zeros(100,1);   %početna iteracija
x = ones(100,1);
b = A*x; %ovako je određen b
tol = 1e-8;

[x,flag,relres,iter,resvec] = pcg(A,b,tol,n+1,[],[],x_0)
%koristim metodu konjugiranih gradijenata, već gotovu

flag 

reziduali =resvec/norm(b,2)
semilogy(1:iter,reziduali(1:iter))
length(reziduali)

%čini se da ovo ne konv