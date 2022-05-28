function [ x, k, X, FX, KOR ] = newton_visestr_nult( f, df, x0, eps, del, N, p )

    X = 0;
    FX = 0;
    KOR = 0;
  
    X(1) = x0;
    KOR(1) = 0;
    FX(1) = f(x0);
  
    k = 2;
    x = x0 - p * f(x0) / df(x0);
    KOR(k) = p * f(x0) / df(x0);
    X(k) = x;
    FX(k) = f(x);

    while (abs(x-x0) > eps) && (abs(f(x)) > del) && (k <  N)
        k = k+1;
        x0 = x;
        x = x0 - p * f(x0) / df(x0);
        X(k) = x;
        FX(k) = f(x);
        KOR(k) =  p * f(x0) / df(x0);
    end
end




