function [i]=bintrazenje(x,t)
  d=1;
  m=size(t,2);
  g=m;
  if x<t(1)*(1-sign(t(1))*1e-14) % ako je x izvan i lijevo od intervala
    i=0;
    return;
  elseif x>t(m)*(1+sign(t(m))*1e-14) % ako je x izvan i desno od intervala
    i=m;
    return;
  elseif abs(x-t(m))<1e-14*t(m) 
    j=1;
    while (t(m-j)==t(m)) % ako je x desni rub intervala, indeks se postavlja 
    j=j+1;               % na zadnji podinterval, tj na prvi èvor prije ruba
    end %while
    i=m-j;
    return;
  end %if
  
  while (g-d)>1 % x je unutar intervala
    s=fix((d+g)/2);
    if x<t(s)
      j=1;
      while (t(s-j)==t(s)) % korekcija indeksa
        j=j+1;
      end %while
      j=j-1;
      g=s-j;
    else
      j=1;
      while (t(s+j)==t(s)) % korekcija indeksa
        j=j+1;
      end %while
      j=j-1;
      d=s+j;
    end %if
  end %while
  i=d;
  
end %function
