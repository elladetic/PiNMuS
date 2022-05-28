function[x,k,X,FX,KOR]=Broyden_sustav(f,x0,epsilon,delta,N,dim)

    k=1;
    x=x0;
    X(:,1)=x;
    FX(:,1)=f(x);
    KOR=[];
  
    h=sqrt(eps)*x;

    for i=1:dim %formiranje matrice A - početni - pomoću podijeljenih razlika;
        pomak=x;
        pomak(i) = pomak(i)+h(i);
        A(:,i) = (f(pomak)-f(x))/h(i);
    end
  
    [Q,R] = qr(A);
    s = R\(-Q'*FX(:,1));  %rješavam sustava po s_k; 
  
    KOR(:,k)=s;
    x=x+s;
    k=k+1;
    X(:,k)=x;
    FX(:,k)=f(x);   
    y=FX(:,k)-FX(:,k-1); %definiramo y;

    %A = A+((y-A*s)*s')/(s'*s); %prelazim na sljedeći 
  
    krit=0;
    for i=1:dim
        pom=abs(X(i,k)-X(i,k-1))/abs(X(i,k-1));
        if (pom>krit)
            krit=pom;
        end
    end
  
    while (k<N && krit>=epsilon && norm(FX(:,k))>=delta)
        v=s/(s'*s);
        u=y-Q*R*s;
        w=Q'*u;
        [Q_tilda,R_tilda]=QRgivens_Broyden(R, w',v');
        R=R_tilda;
        Q=Q*Q_tilda;
        s=R\(-Q'*FX(:,k));
    
        KOR(:,k)=s;
        x=x+s;
        k=k+1;
        X(:,k)=x;
        FX(:,k)=f(x);
        y=FX(:,k)-FX(:,k-1);
        %A=A+((y-A*s)*s')/(s'*s);
    
        krit=0;
        for i=1:dim
            pom=abs(X(i,k)-X(i,k-1))/abs(X(i,k-1));
            if (pom>krit)
                krit=pom;
            end
        end
    
    end
  
end