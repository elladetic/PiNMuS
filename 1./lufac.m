function A = lufac(A, n)
    for k=1:n-1
        for j=k+1:n 
            A(j,k)=A(j,k)/A(k,k);
        end
        for j=k+1:n
            for i=k+1:n 
                A(i,j)=A(i,j)-A(i,k)*A(k,j);
            end     
        end
    end 
end 