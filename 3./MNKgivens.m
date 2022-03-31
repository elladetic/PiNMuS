

function [x] = MNKgivens(A, b)
  [m,n] = size(A);

  for j = 1:n
    for i = m:-1:(j+1)
      [c,s] = givens2( A(i-1,j),A(i,j) );
      A = givensnamatricu(A, i-1, i, c, s);
      b = givensnamatricu(b, i-1, i, c, s);
    end
  end
 
  R = triu(A(1:n,1:n));
  x = R \ b(1:n);

  
end