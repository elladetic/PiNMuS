function [x_k, ro_k, k, residuals] = metoda_potencija(A, x_0, tol) 
    %A je matrica, x_0 je početna iteracija, tol je tolerancija na normu
    %reziduala
    %funkcija vraća sljedeće:
    %x_k aproksimacija svojstvenog vektora
    %ro_k je aproksimacija svojstvene vrijednosti
    %k je broj iteracija
    %residuals je vektor reziduala za svaku iteraciju

    k = 0; %počinjemo od 0 
    x_k = x_0;  %testiramo i za x_0

    ro_k = (x_k)'* A * x_k; %svojstvena vrijednost
    residual = A * x_k - ro_k * x_k;
    residual_norm = norm(residual, 2);
    
    residuals(k+1) = residual_norm;

    while ( norm(A*x_k-ro_k*x_k, 2) > tol) %sve dok ne dođemo do kriterija zaustavljanja
        y_k = A * x_k;
        x_k = y_k / norm(y_k,2); %normiramo

        ro_k = (x_k)'* A * x_k;

        residual = A*x_k - ro_k * x_k;
        residual_norm = norm(residual, 2);

        k = k + 1; 
        residuals(k) = residual_norm;
    end
 

end 