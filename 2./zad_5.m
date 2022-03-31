n = 100;
pom = ones(10,10);
u = pom*diag(1:10);
v = u(:); %na taj način generiram svojstvene vrijednosti 

M = diag(v);

X = rand(100);
[Q,R] = qr(X);
A = Q*M*(Q.');
x_0 = zeros(100,1);
x = ones(100,1);
b = A*x;
tol = 0.0000001;


[x,flag,relres,iter,resvec]=pcg(A,b,tol,100,[],[],x_0);

%flag=0

res = resvec/norm(b,2)
plot(1:iter,res(1:iter))
pause
semilogy(1:iter,res(1:iter))


%vidi se da ovo konvergira