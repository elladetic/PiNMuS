function b = luslv(A, b, n)
    for i=2:n
        for j=1:i-1 
            b(i)=b(i)-A(i,j)*b(j);
        end 
    end
    b(n) = b(n) / A(n,n);
    for i=n-1:-1:1
        for j=i+1:n 
            b(i)=b(i)-A(i,j)*b(j);
        end
        b(i)=b(i)/A(i,i);
    end
end 