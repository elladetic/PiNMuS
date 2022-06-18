function [l,k]=backtracking(x0,f0,f,g,p)
alfa=10^-4;
l=1;
x1=x0+l*p;
ff1=f(x1);
s=g'*p;
if s>=0
    disp('s je nenegativan!')
    return
end
k=0;
while ff1>f0+alfa*l*s
    k=k+1;
    if l==1
        lpom=(-s)/(2*(ff1-f0-s));
    else
        ab=1/(l-l0)*([1/l.^2, -1/l0.^2; -l0/l.^2, l/l0.^2]*[ff1-f0-l*s; ff0-f0-l0*s]);
        d=ab(2)*ab(2)-3*ab(1)*s;
        if ab(1)==0
            lpom=-s/2/ab(2);
        else
            lpom=(-ab(2)+sqrt(d))/3/ab(1);
        end
        if lpom>0.5*l
            lpom=0.5*l;
        end
    end
    l0=l;
    ff0=ff1;
    if lpom<=0.1*l
        l=0.1*l;
    else
        l=lpom;
    end
    x1=x0+l*p;
    ff1=f(x1);
end