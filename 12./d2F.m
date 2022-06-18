function y = d2F(x,r)

    n = [138 83 64; 64 67 84];
    g_ = g(x);
  
    h_f = zeros(5,5);
    h_f(1,1) = sum(n(1,:))/(x(1)^2);
    h_f(2,2) = sum(n(2,:))/(x(2)^2);
    h_f(3,3) = sum(n(:,1))/(x(3)^2);
    h_f(4,4) = sum(n(:,2))/(x(4)^2);
    h_f(5,5) = sum(n(:,3))/(x(5)^2);
  
    tmp = 0;
    for i = 1:10
        tmp = tmp-2*min(sign(g_(i)),0);
    end
    tmp = tmp+10;
  
    y = h_f + r*tmp;
end