function[lam,kl]=backtracking(f,xk,g,p)

 %provjera radi li se o smjeru silaska;
  if (g'*p>=0)
    disp("Nije smjer silaska!!!");
    return;
  end

  alpha=1e-4;
  lam=1;
  old=1; 
  kl=0;

  H=g'*p; 
  
  while (f(xk+lam*p)>f(xk)+alpha*lam*H)  
    kl=kl+1; %broj iteracija;
    if (kl==1)
        lam_kap=(-H)/(2*(f(xk+p)-f(xk)-H));
    else
      
      first =(f(xk+lam*p)-f(xk)-lam*H)/(lam^2) ;
      second = (f(xk+old*p)-f(xk)-old*H)/(old^2);
      a=(first-second)/(lam-old);
      b=(-old*first+lam*second)/(lam-old);
      
      if (a==0)
        lam_kap=-H/(2*b);
      else
        lam_kap=(-b+sqrt(b^2-3*a*H))/(3*a);
      end
      
      if (lam_kap>0.5*lam)
        lam_kap=0.5*lam;
      end
      
    end
    
    if (lam_kap<=0.1*lam)
        
      old=lam;
      lam=0.1*lam;
      
    else
      old=lam;
      lam=lam_kap;
      
    end
  
  end
  
 end