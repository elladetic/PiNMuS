function[x,k,X,FX,mi,llam,klam]=glob_mod_Newton_minim(f,df,d2f,x0,dim,epsilon,delta,N)

    k=1;
    x=x0;
    X(:,k)=x;
    FX(:,k)=f(x);
    nf=df(x);
    krit=epsilon; %isti princip kao i prosli put

   %algoritam sa slajda 8
  while(k<N && krit>=epsilon && norm(nf)>=delta)
      
    hes=d2f(x);
    ro=sort(eig(hes),'descend'); %svojstvene vrijednosti

    if (ro>0) 
        mi_k=0;
      
    else
        
      if(ro(1)==ro(end) && ro(1)<10^(-5))
          
        mi_k=10^(-5)-ro(1);
        
      elseif (ro(1)> 10^5*ro(end) || (ro(end)<ro(1)*10^5 && ro(1)*10^5<=0))
          
        if (abs(ro(end))<ro(1))
            
          mi_k=10^(-5)*ro(1)-ro(end);
          
        else
            
          mi_k=-ro(end)*(1+10^(-5));
          
        end
        
      else
          
        mi_k=0;
        
      end
      
    end

    mi(k)=mi_k;
    H=hes+mi_k*eye(dim); %modificirani korak umjesto ono obiènog
    L=chol(H,'lower'); %faktorizaciaj Choleskog
    y=L\(-nf);
    sk=L'\y;
    
    [lam,kl]=backtracking(f,x,nf,sk);
    llam(k)=lam;
    klam(k)=kl;
    x=x+lam*sk;
    k=k+1;
    
    X(:,k)=x;
    FX(:,k)=f(x);
    nf=df(x);

    krit=0;
    for (i=1:dim)  
      pom=abs(X(i,k)-X(i,k-1))/abs(X(i,k-1));
      if (pom>krit)
          krit=pom;
      end
    end  

   end
  
end

