function y = g(x)

    for i = 1:5
        y(2*i-1)=x(i);
        y(2*i)=1-x(i);
    end

    y(11) = x(1)+x(2)-1;
    y(12) = -x(1)-x(2)+1;
    y(13) = x(3)+x(4)+x(5)-1;
    y(14) = -x(3)-x(4)-x(5)+1;



end