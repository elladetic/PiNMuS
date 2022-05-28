function[x,k,X,FX,KOR]=podjel_razl_sustav(f,x0,epsilon,delta,N,dim)
    %koristimo je kad je problem izračunati Jacobijevu matricu;
  
    k=1;
    x=x0;
    X(:,1)=x;
    FX(:,1)=f(x);
    KOR=[];
    krit=epsilon;
  
    while (k < N && krit>=epsilon && norm(FX(:,k)) >= delta)
        h=sqrt(eps) * x;

        for i=1:dim
            pomak = x;
            pomak(i) = pomak(i)+h(i);
            deltaf(:,i) = (f(pomak)-f(x))/h(i);
        end
    
        s=deltaf \ (-FX(:,k));
        KOR(:,k)= s; %spremam korak;
        x=x+s;
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