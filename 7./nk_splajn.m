
function alpha = nk_splajn(t,x,y,k)

    m = max(size(x));
    n = max(size(t)) - k;

    [x_sort,x_ind] = sort(x);
    y_sort = y(x_ind);


    A = zeros(m,n);

    for i = 1:m
        l = bintrazenje(x_sort(i),t);
        for j = 1:k
            A(i,l-k+j) = deBoorCox(x_sort(i), l-k+j, k, n, t);
        end
    end

    [U,S,V] = svd(A,0);

    for i =1:n
        S_inv(i,i) = 1/S(i,i);
    end


    alpha = V * S_inv * U' * y_sort;   
    

end 