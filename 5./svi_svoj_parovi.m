function [l, S, g, kS] = svi_svoj_parovi(A, x_0, tol)
    
    T = schur(A, "real");
    all_lambda = sort(diag(T), 'descend');
    n = size(all_lambda, 1);

    l = [];
    S = zeros(n, n);
    kS = [];
    g = [];

    for i = 1 : n
        ksi = rand;
        mi = all_lambda(i) * (1 + 1e-3 * (2 * ksi - 1 ));
        [x_k, ro_k, k, ~] = inverzne_iteracije(A, x_0, mi, tol);
        l(i) = ro_k;
        S(:, i) = x_k;
        g(i) = norm(A * S(:,i) - l(i) * S(:,i), 2);
        kS(i) = k;
    end

end