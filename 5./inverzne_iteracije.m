function [x_k, ro_k, k, residuals] = inverzne_iteracije(A, x_0, mi, tol) 
    
    k = 0; 
    [m,n] = size(A);
  
    [L,U,P] = lu(A - mi*eye(m));
    x_k = x_0;      %počinjemo s x_0                     
    ro_k = (x_k)' * A * x_k;                  
             
    norm_residual = norm(A * x_k - ro_k * x_k, 2);
  
    residuals(k+1) = norm_residual; 
  
    while ( norm( A * x_k - ro_k * x_k, 2) > tol) %sve dok vrijedi kriterij zaustavljanja

        y_pom = L \ (P * x_k);
        y_k = U \ y_pom;

        x_k = y_k / norm(y_k,2);
        ro_k = (x_k)'* A * x_k;
     
        norm_residual = norm(A * x_k - ro_k * x_k, 2);
        
        k = k + 1; 
        residuals(k) = norm_residual;
    end 


end 