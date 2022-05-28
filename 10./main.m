%format long e;
format short e;

eps = 1e-10;
del = 1e-10;
N = 50;
dim = 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% x_1   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0_1=[1.5;2];
[x1(:,1),k1(1),X_n1,FX_n1,KOR_n1] = Newton_sustav(@f,@df,x0_1,eps,del,N,dim);
[x1(:,2),k1(2),X_ng1,FX_ng1,KOR_ng1] = Newton_glob_sustav(@f,@df,x0_1,eps,del,N,dim);
[x1(:,3),k1(3),X_pr1,FX_pr1,KOR_pr1]=podjel_razl_sustav(@f,x0_1,eps,del,N,dim);
[x1(:,4),k1(4),X_b1,FX_b1,KOR_b1]=Broyden_sustav(@f,x0_1,eps,del,N,dim);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% x_2   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0_2=[0.5;0.4];
[x2(:,1),k2(1),X_n2,FX_n2,KOR_n2] = Newton_sustav(@f,@df,x0_2,eps,del,N,dim);
[x2(:,2),k2(2),X_ng2,FX_ng2,KOR_ng2] = Newton_glob_sustav(@f,@df,x0_2,eps,del,N,dim);
[x2(:,3),k2(3),X_pr,FX_pr2,KOR_pr2] = podjel_razl_sustav(@f,x0_2,eps,del,N,dim);
[x2(:,4),k2(4),X_b2,FX_b2,KOR_b2] = Broyden_sustav(@f,x0_2,eps,del,N,dim);


function[fx]=f(x)
  fx(1)=x(1)^2+x(2)^2-2;
  fx(2)=exp(x(1)-1)+x(2)^3-2;
end

function[dfx]=df(x)
  dfx(1,1)=2*x(1);
  dfx(1,2)=2*x(2);
  dfx(2,1)=exp(x(1)-1);
  dfx(2,2)=3*x(2)^2;
end