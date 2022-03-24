function G = givensnamatricu(A, i, k, c, s)
    G = mtimes( [[c,-s]; [s,c]], A([i,k], :));
end