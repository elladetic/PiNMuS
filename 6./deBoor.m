function y = deBoor(x, k, n, t, a) 
%racunamo vrijednosti kubicnog splajna u danoj točci x
%obavezno koristi samo jedno 1D polje!

    i = bintrazenje(x,t); %prvo nalazimo čvorove između kojih se x nalazi
    alphe = a;

    for r = 1 : (k-1)
        for j = i : -1 : (i - k + r + 1)
            if (t(j) ~= t(j+k-r)) 
                omega = (x - t(j)) / ( t(j+k-r) - t(j) );
            else 
                omega = 0;
            end
            alphe(j) = ( 1 - omega) * alphe(j-1)  + omega * alphe(j);
        end 
    end 

    y = alphe(i);

end
