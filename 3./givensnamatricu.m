

function A = givensnamatricu(A, i, k, c, s)
    %G = mtimes( [[c,-s]; [s,c]], A([i,k], :));
    [m,n] = size(A);
    for j=1:n 
        t_1 = A(i,j);
        t_2 = A(k,j);
        A(i,j) = c*t_1 - s*t_2;
        A(k,j) = s*t_1 + c*t_2;
    end
end