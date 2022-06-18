function [ y ] = d2f( x )
    
    n = [138 83 64; 64 67 84];
    koef = [sum(n(1,:)), sum(n(2,:)), sum(n(:,1)), sum(n(:,2)), sum(n(:,3))];
    
    y=koef.*[1/(x(1)^2), 1/(x(2)^2), 1/(x(3)^2), 1/(x(4)^2), 1/(x(5)^2)];
    
    y=diag(y);

end

