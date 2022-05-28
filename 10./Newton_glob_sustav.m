function[x,k,X,FX,KOR]=Newton_glob_sustav(f,df,x0,epsilon,delta,N,dim)

    k=1; 
    x=x0;
    X(:,1)=x;
    FX(:,1)=f(x);
    KOR=[];
    krit=epsilon;
  
    while (k<N && krit>=epsilon && norm(FX(:,k)) >= delta)
        d=df(x)\FX(:,k); %inverz od Jacobijana puta ono; 
        gama=1/cond(df(x),2); %reciprocna vrijednost Jacobijana; 
        fk0=FX(:,k)'*FX(:,k);
        pom2=gama/4*norm(d)*norm(2*FX(:,k)'*df(x));

        j=0; %nalazimo indeks j; 
        while (f(x-2^(-j)*d)'*f(x-2^(-j)*d)>fk0-2^(-j)*pom2)
            j=j+1;
        end
    
        m=f(x-d)'*f(x-d);

        ind=0; %nalazim indeks i_min; 
        for i = 0:j 
            pom3=f(x-2^(-i)*d)'*f(x-2^(-i)*d);
            if pom3<m
                m=pom3;
                ind=i;
            end
        end
    
        lambda=2^(-ind);
        if (lambda<0.01)
            lambda=0.01;
        end
    
        x = x - lambda * d; %sljedeci korak; 
        KOR(:,k) = lambda * d; 
        k=k+1;
        X(:,k)=x;
        FX(:,k)=f(x);
    
        krit=0;
        for i=1:dim
            pom=abs(X(i,k)-X(i,k-1))/abs(X(i,k-1));
            if (pom>krit)
                krit=pom;
            end
        end
    
   end
  
end
