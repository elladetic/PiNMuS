function[x,k,X,FX,KOR]=Newton_sustav(f,df,x0,epsilon,delta,N,dim)

  k=1; %spremam za početni x;
  x=x0;
  X(:,1)=x;
  FX(:,1)=f(x);
  KOR=[];
  krit=epsilon;
  
  while (k<N && krit>=epsilon && norm(FX(:,k))>=delta) %kriteriji zaustavljanja
    s=df(x)\(-FX(:,k));
    KOR(:,k)=s;
    x=x+s;
    k=k+1;
    X(:,k)=x;
    FX(:,k)=f(x);
    
    krit=0;
    for (i=1:dim)
      pom=abs(X(i,k)-X(i,k-1))/abs(X(i,k-1));
      if (pom>krit)
        krit=pom;
      end
    end
    
  end
  
end

