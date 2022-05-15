function x_inv = rho (x, n)
%okreće znamenke binarnog broja;

x_inv = dec2bin(x, n);

x_inv = fliplr(x_inv);

x_inv = bin2dec(x_inv);

end 