function b = FFT (f, n)
%implementacija FFT algoritma

b = zeros(2^n,1);

for j = 0 : (2^n - 1)
    i = rho(j, n);
    b(j + 1) = f(i + 1);
end


for m = 1 : n
    for j = 0 : (2^(m-1) -1)
        e = exp(-2i * pi * j / 2^m);
        for q = 0 : 2^m : 2^n -1
            u = b(q+j+1);
            v = b(q + j + 1 + 2^(m-1)) * e;
            b(q + j + 1) = u + v;
            b(q + j + 1 +2^(m-1)) = u - v;
        end
    end
end

b = b / 2^n;


end 