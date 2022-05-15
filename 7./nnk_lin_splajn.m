function [A, b] = nnk_lin_splajn(u, f)
    n = length(u);
    t = [u(1), u, u(n)];
    A = zeros(n,n);
    A(1,1) = (t(3)-t(2)) / 3;
    A(1,2) = (t(3)-t(2)) / 6;
    A(n,n) = (t(n+1)-t(n)) / 3;
    A(n, n-1) = (t(n+1)-t(n)) / 6;
    
   for i=2:(n-1)
        A(i,i) = (t(i+2) - t(i)) / 3;
        A(i, i+1) = (t(i+2) - t(i+1)) / 6;
        A(i, i-1) = (t(i+1) - t(i)) / 6;
   end
   

    b = zeros(n, 1);
    B_1 = @(x) (t(3)-x)./(t(3) -t(2));
    f_1 = @(x)f(x).*B_1(x);
    b(1) = quad(f_1, t(2), t(3));
    B_1 = @(x) (x - t(n))./(t(n+1) -t(n));
    f_1 = @(x)f(x).*B_1(x);
    b(n) = quad(f_1, t(n), t(n+1));
    
    
    for i = 2:(n-1)
        B_1 = @(x) (x-t(i))./(t(i+1) -t(i));
        f_1 = @(x)f(x).*B_1(x);
        B_2 = @(x) (t(i+2)-x)./(t(i+2) -t(i+1));
        f_2 = @(x)f(x).*B_2(x);
        b(i) = quad(f_1, t(i), t(i+1)) + quad(f_2, t(i+1), t(i+2));
    end
end

