function [x,k,xx,fx,mmi,ll,kl]=glob_mod_Newton_minim(f,df,d2f,x0,dim,epsilon,del,N)
x=x0;
gr=2*epsilon; 
k=1;
ff=f(x);
x
xx(k,1:dim)=x;fx(k)=ff;kkor(k,1:dim)=0;ll(k)=0;kl(k)=0;mmi(k)=0;
while gr>=epsilon && norm(df(x),2)>=del && k<N
    g=df(x);
    H=d2f(x);
    sv=sort(eig(H));
    sv1=sv(dim);sv2=sv(1);
    mi=0;
    if sv1==sv2 && sv1<10^(-5)
        mi=10^(-5)-sv2;
        H=H+mi*eye(dim,dim);
    end
    if (sv1>10^5*sv2) || (sv1<=0 && sv2<10^5*sv1)
        if abs(sv2)<sv1
            mi=10^(-5)*sv1-sv2;
        else
            mi=-sv2*(1+10^(-5));
        end
        H=H+mi*eye(dim,dim);
    end
    R=chol(H);
    p=-R\(R.'\g);
    g
    [l,kkl]=backtracking(x,fx(k),f,g,p);
    x1=x+l*p; ff=f(x1);
    gr=max(abs((x1-x)./x));
    k=k+1;
    x=x1;
  
    xx(k,1:dim)=x;fx(k)=ff;ll(k)=l;kl(k)=kkl;mmi(k)=mi;
end
end