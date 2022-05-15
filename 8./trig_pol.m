function [ psix ] = trig_pol(x, N, A, B )
%vrijedsnot trigonometrijskog polinoma

M = N / 2;

psix = A(1) / 2;
suma = 0;

for h = 1 : (M - 1)
    suma = suma + A(h + 1) * cos(h * x) + B(h + 1) * sin(h * x);  
    
end
psix = psix + suma + A(M + 1) / 2 * cos(M * x);

end