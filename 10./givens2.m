function [c,s]=givens2(a,b)
if b==0
    c=1;
    s=0;
else
    if abs(b)>abs(a)
        t=-a/b;
        s=-sign(b)/sqrt(1+t*t);
        c=s*t;
    else
        t=-b/a;
        c=sign(a)/sqrt(1+t*t);
        s=c*t;
    end
end
    