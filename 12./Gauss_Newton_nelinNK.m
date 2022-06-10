function [x, k, X, FX] = Gauss_Newton_nelinNK(R, J, x0, n, m, epsilon, delta, N)
   
    X = [];
    k = 0;
    FX = [];

    %prva iteracija izvan petlje za provjeru kriterija
    r_0 = R(x0);
    j_0 = J(x0);   
    [Q_j,R_j] = qr(j_0); %qr faktorizacija od J(x_k)
    korak = R_j \ (R_j' \ (-j_0' * r_0));

    kriterij_1 = max(abs(korak./x0));
    kriterij_2 = -r_0'*j_0*korak / (norm(j_0 * korak) * norm(r_0));

    while(k <= N  &&  delta <= kriterij_2 && epsilon <= kriterij_1)
        k = k+1; %povećavam broj iteracija u svakom koraku
        X(:,k) = x0;
        
        kriterij_1 = max(abs(korak./x0));
        x0 = x0 + korak; %mičem se za korak;


        %računanje kriterija
        j_0 = J(x0);
        [~, R_j] = qr(j_0, 0); %qr faktorizacija od J(x_k)
        
        r_0 = R(x0);
        FX(k) = 1/2 * r_0' * r_0;
        

        korak = R_j \ (R_j' \ (-j_0' * r_0));

        kriterij_2 = -r_0'*j_0*korak / (norm(j_0 * korak) * norm(r_0));

    end

    x = x0;



end
