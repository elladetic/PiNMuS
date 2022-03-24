function [Q,R,x] = MNKgivens(A, b)
  [m,n] = size(A);
  Q = eye(m);
  R = A;

  for j = 1:n
    for i = m:-1:(j+1)
      G = eye(m);
      [c,s] = givens2( R(i-1,j),R(i,j) );
      G([i-1, i],[i-1, i]) = [c -s; s c];
      R = G'*R;
      Q = Q*G;
    end
  end
  
  [m,n] = size(R);
  for i = 1:n %ovo nisam zicer jel ok jer nez kak drugacije stavit ove gluposti na 0 osim eksplicitno
        for j = (i+1):m
            R(j,i) = 0;
        end
  end

  x = R(1:n,1:n) \ Q(1:m,1:n)' * b;
 
end