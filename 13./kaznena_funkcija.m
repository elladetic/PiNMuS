function [x, k, kbm, X, G] = kaznena_funkcija(F, dF, d2F, g, x0, r0, dim, epsilon, N)
    
    X(:, 1) = x0; 
    G(1) = min(g(x0));
    k = 1;

    rk = r0;
    x = x0;
    while(G(k) <= -epsilon && k <= N)
        
        rk = 10 * rk;

        new_F = @(x)(F(x,rk)); %trik koji koristimo jer Newton želi F(x), ovak će r uć kao parametar
        new_dF = @(x)(dF(x,rk));
        new_d2F = @(x)(d2F(x,rk));

        [x_new, kbm(k), ~, ~, ~, ~, ~] = glob_mod_Newton_minim(new_F, new_dF, new_d2F, x, dim, epsilon, epsilon, N);

        k = k+1;

        X(:, k) = x_new;

        G(k) = min(g(x));
        x = x_new;
    end

end 