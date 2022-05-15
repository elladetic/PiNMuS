function y = deBoorCox(x, i, k, n, t) 
%gledamo i-ti, npr treci, a i_ vraća interval!

    i_ = bintrazenje(x,t);

    %if i == i_
        %y = 0;
    %end 
        
    if( k == 1 )                                                                  

            if(i == i_)
               y = 1;
            else
               y = 0;
            end
    end

    if( k > 1)

        if(t(i) ~= t(i+k-1) )
            omega_1 = (x-t(i))/(t(i+k-1)-t(i));
        else
            omega_1 = 0;
        end

        if (t(i+1)~=t(i+k))
            omega_2 = (x-t(i+1))/(t(i+k)-t(i+1));
        else
            omega_2 = 0;
        end

    y = omega_1 * deBoorCox(x,i,k-1,n,t) + (1-omega_2) * deBoorCox(x,i+1,k-1,n,t);
    end

end