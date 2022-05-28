function [ x, k, A, B,  X, FX ] = bisekcija( f, a, b, eps )

    x = (a + b)/ 2; %polovi�te;
    k = 0;

    while (b - x > eps)
        if (f(x) * f(b) < 0) %gledam kud se pomi�em;
            a = x;
        else
            b = x;
        end
    
        k = k + 1; %ra�unam broj iteracija;
        A(k) = a;
        B(k) = b;
        X(k) = x;
        FX(k) = f(x);
    
        x = (a + b)  /  2;

end


end

