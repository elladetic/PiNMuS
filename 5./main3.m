load mat_kompl_sv_vrijed.mat;

T = schur(A);
n = size(T,1);
my_eig = [];
i = 1;

while(i < n)

    if not( T(i+1,i) == 0)  %imas blok

        a = T(i,i);
        b = T(i, i+1);
        c = T(i+1, i);
        d = T(i+1, i+1);
        my_sqrt = sqrt(((a+d) ^ 2 ) - 4 * (a*d - b * c));

        my_eig(i) = (a + d + my_sqrt) / 2;
        my_eig(i+1) = (a + d - my_sqrt) / 2;

        i = i+2; %skočiš za dva
    end

    if T(i+1,i) == 0  %nemas blok
        my_eig(i) = T(i,i);
        i = i+1; %skočiš za jedan
    end 

    if( i == n) %rubni case, nece se desit ak je zadnji blok al sad nije
        my_eig(i) = T(i,i);
    end

end 


%usporedba rezultata
eig(A)
%ovo se cini prilicno zadovoljavajuće