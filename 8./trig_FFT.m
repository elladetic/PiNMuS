function [ A, B ] = trig_FFT( f, n )
%FFT algoritam, vraća koeficijente trig polinoma

b = FFT(f,n);

N = 2^n;
M = N / 2;

A = zeros(M + 1, 1);
B = zeros (M, 1);

A(1) = 2 * b(1);

for h = 1 : M - 1
    A(h + 1) = b(h + 1) + b(N - h + 1);
    B(h + 1) = 1i * (b(h + 1) - b(N - h + 1));
end

A(M+1) = 2 * b(M + 1);


end