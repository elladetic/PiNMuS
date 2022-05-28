function [ x, k, X, FX, KOR ] = sekanta( f, x0, x1, eps, del, N )

    if (abs(f(x0)) < del)
        return 
    end

    x = x0;
    k = 0;
    X(1) = x0;
    X(2) = x1;
    FX(1) = f(x0);
    FX(2)=f(x1);
    KOR(1)=0;
    KOR(2)=(f(x1) * ((x1 - x0)/(f(x1) - f(x0))));

    

    k = 3;
    x = x1 - (f(x1) * ((x1-x0)/(f(x1) - f(x0))));
    KOR(k) = (f(x1) * ((x1-x0)/(f(x1) - f(x0))));
    X(k) = x;
    FX(k) = f(x);
    while (abs(x-x1) > eps) && (abs(f(x)) > del) && (k<=N)
        k = k + 1;
        x0 = x1;
        x1 = x;
        x = x1 - (f(x1) * ((x1 - x0)/(f(x1) - f(x0))));
        X(k) = x;
        FX(k) = f(x);
        KOR(k) = (f(x1) * ((x1-x0) /(f(x1) - f(x0))));
    end
  
end

