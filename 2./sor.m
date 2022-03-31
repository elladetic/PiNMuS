function [x_k,k,v]=sor(A,b,x_0,tol,omega)
%funkcija za implementiranje SOR metodu za rješavanje linearnih sustava
    k = 0;
    n = length(A);
    x_k = zeros(n,1);
    v(1) = norm(b-A*x_k,2)/norm(b,2);

    while ( norm(b-A*x_k,2)/norm(b,2) > tol ) 
        %sve dok nije zadovoljen kriterij zaustavljanja
        k=k+1;
        for i=1:n
            x_0(i)=(1-omega)*x_0(i);
            pom=b(i);

            for j=1:(i-1)
                pom=pom-A(i,j)*x_0(j);
            end

            for j=(i+1):n
                pom=pom-A(i,j)*x_0(j);
            end

            x_0(i)=x_0(i)+pom*omega/A(i,i);
        end

        x_k=x_0;
        v(k+1)=norm(b-A*x_k,2)/norm(b,2); %relativne norme reziduala
    end
end






