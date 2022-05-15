function y = fazni_Horner (x, p)

epsilon = exp(i*x);

N = max(size(p));

y = p(N);

for j= N - 2: -1 : 0
    y = y * epsilon + p(j + 1);
end


end 