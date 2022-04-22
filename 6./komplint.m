function a = komplint(l, x, p, p_0, p_l)
%provjeriti jel p dimenzije l+1
     n = l + 3;
 
     t = [x(1) x(1) x(1) x x(end) x(end) x(end)];

     %i = bintrazenje(x,t);

     B = zeros(n,n);
     B(1,1) = 1;
     B(n,n) = 1;

     B(2,1) = -3 / (t(5) - t(2)) * deBoorCox(x(1), 2, 3, n, t);
     B(2,2) = -B(2,1);

     

     for j = 3 : (n-1) 
         B(j,j) = deBoorCox(x(j-1), j, 4, n, t); 
         B(j, j-1) = deBoorCox(x(j-1), j-1, 4, n, t);
         B(j, j+1) = deBoorCox(x(j-1), j+1, 4, n, t); 
         
     end

     B(n-1, n) = 3 / (t(n+3) - t(n)) *  deBoorCox(x(l+1), n, 3, n, t);
     B(n-1, n-1) = -B(n-1,n);

    

     p = [p(1) p_0 p(2:(l)) p_l p(l+1)];

     a = B \ p'; 
    
end