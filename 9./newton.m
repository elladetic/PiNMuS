function [ x, k, X, FX, KOR ] = newton(f, df, x0, eps, del, N)

    if (abs(f(x0)) < del)
      return 
    end
  
    %kriterij zaustavljanja
    k = 1; %prva iteracija;
    X(k) = x0;
    KOR(k) = f(X(k)) / df(X(k));
    FX(k) = f(x0);
  
    k = k + 1; %druga iteracija;
    x = x0 - f(x0) / df(x0);
    KOR(k) = f(x0) / df(x0);
    X(k) = x;
    FX(k) = f(x);

    while (and(abs(x - x0) >= eps,abs(f(x)) >= del & k  <= N))
      
        k = k + 1;
        x0 = x;
        x = x0 - f(x0) / df(x0);
        X(k) = x;
        KOR(k) = f(x0) / df(x0);
        FX(k) = f(x);
      
    end 
   
  
end

