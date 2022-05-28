function [x,k,KBIS,X,FX,RAZL] = newton_glob(f, df, x0, eps, del, N)
    KBIS=0;
    X=0;
    FX=0;
    RAZL=0;
  
    v=f(x0);
  
    if (abs(v) < eps)
        x=x0;
        k=1;
        KBIS=0;
        X=x0;
        FX=v;
        RAZL=0;
        return 
    end
  
    j=0;
    for k=1:N
        j=j+1;
        x=x0 - v/df(x0);
        X(j)=x;
        FX(j)=f(x);
        if j>1
            RAZL(j-1)=X(j)-X(j-1);
        end
      

        w=f(x);

        KBIS(k)=0;
        while abs(w) >= abs(v)
            j=j+1;

            x=(x+x0)/2;
            X(j)=x;
            FX(j)=f(x);
            KBIS(k)=KBIS(k)+1;
            RAZL(j-1)=X(j)-X(j-1);
        
            w=f(x);
        end
        if (abs(x-x0) < eps) | (abs(w) < del)
            return
        else
            x0=x;
            v=w;
        end
     end
end
