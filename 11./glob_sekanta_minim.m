function[x,k,X,FX,llam,klam]=glob_sekanta_minim(f,df,x0,dim,epsilon,delta,N)

    k=1;
    x=x0;
    X(:,k)=x;
    FX(:,k)=f(x);
    nf=df(x);
    krit=epsilon;

    H=abs(f(x))*eye(dim);

    while(k<N && krit>=epsilon && norm(nf)>=delta)
        
      L=chol(H,'lower'); %faktorizacija
      z=L\(-nf);
      sk=L'\z; %rješavam sustav
      [lam,kl]=backtracking(f,x,nf,sk);
      llam(k)=lam;
      klam(k)=kl;
      x=x+lam*sk;
      sk = lam * sk;
      
      k=k+1;
      X(:,k)=x;
      FX(:,k)=f(x);
      nf=df(x);
      yk=nf-df(X(:,k-1));
      
      if (sk'*yk >  sqrt(eps/2)*norm(sk)*norm(yk))
        H=H+(yk*yk')/(yk'*sk)-(H*sk*sk'*H)/(sk'*H*sk);
      end
      
      krit=0;
      for i=1:dim % while uvjet za provjeru kriterija zaustavljanja
        tmp=abs(X(i,k)-X(i,k-1))/abs(X(i,k-1));
        if (tmp>krit)
          krit=tmp;
        end
      end  
      
      end
  
    end

