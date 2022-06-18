function y = F(x,r) 
    %proširena funkcija cilja
    n=[138 83 64; 64 67 84]; %sladjd 2
 
    y = 0; %zbog minusa u for petlji
    for i = 1:2 %ovo je f
        for j = 3:5
        y = y - n(i,j-2) * (log(x(i))+log(x(j)));
        end
    end
  
    gx = g(x)';
    tmp=0;
    for i = 1:10
        tmp = tmp+min(gx(i),0)^2; %ovo je p(t)
    end
  
    tmp = tmp+gx(11)^2+gx(13)^2;
    y = y + r * tmp;
end