%%%%%%%%%%%%%%%%%%%%%% PRVA FUNKCIJA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f1 = @(x) x^3 - 1.5;
df1 = @(x) 3 * x^2;
x01 = 1.7;
x11 = 1.62;

[x, k, A, B, X, FX] = bisekcija( f1, 1, 2, 1e-8);
%x = 1.144714243710041e+000, k = 26 
[ x, k, X, FX, KOR ] = newton( f1, df1, x01, eps, 1e-8, 1000 );
%x = 1.144714242553338e+000, k = 6;
[ x, k, X, FX, KOR ] = sekanta( f1, x01, x11, 1e-8, 1e-8, 1000 );
%x = 1.144714242668890e+000, k = 8;

%najbrze konvergira za Newtonovu metodu, onda za metodu sekante, pa za
%metodu bisekcije!

%%%%%%%%%%%%%%%%%%%%%% DRUGA FUNKCIJA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f2 = @(x) atan(x);
df2 = @(x) 1 / (1 + x^2);

[ x, k, X, FX, KOR ] = newton( f2, df2, 1, 1e-10, 1e-10, 1000 );
%x = 0, k = 6;
[ x, k, KBIS, X, FX, RAZL ] = newton_glob( f2, df2, 1, 1e-10, 1e-10, 100 );
%x=0, k = 5;

[ x, k, X, FX, KOR ] = newton( f2, df2, 1.39174520027073489, 1e-10, 1e-10, 1000 );
%x =   1.39174520023, k = 1001;
[ x, k, KBIS, X, FX, RAZL ] = newton_glob( f2, df2, 1.39174520027073489, 1e-10, 1e-10, 100 );
%x = 0, k = 1;

[ x, k, X, FX, KOR ] = newton( f2, df2, -1.39174520027073489, 1e-10, 1e-10, 100 );
%x =   -1.391745200270735e+000, k = 101 
[ x, k, KBIS, X, FX, RAZL ] = newton_glob( f2, df2, -1.39174520027073489, 1e-10, 1e-10, 100 );
%x = 0, k =1;

[ x, k, X, FX, KOR ] = newton( f2, df2, 5, 1e-10, 1e-10, 100 );
%x =   NaN, k = 11;
[ x, k, KBIS, X, FX, RAZL ] = newton_glob( f2, df2, 5, 1e-10, 1e-10, 100 );
%x = 0, k=6;

%konvergira samo za x0=1!!


%%%%%%%%%%%%%%%%%%%%%% TRECA FUNKCIJA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f3 = @(x) x^3 - 5.56 * x^2 + 9.1389 * x - 4.68999;
df3 = @(x) 3 * x^2 -11.12 * x + 9.1389 ;

[ x, k, X, FX, KOR ] = newton( f3, df3, 1.5, 1e-10, 1e-10, 100 );
%x =7.379439009825375e-001, k = 16;
[ x, k, X, FX, KOR ] = newton_visestr_nult( f3, df3, 1.5, 1e-10, 1e-10, 100, 2 );
%x 1.2300, k =4;

u = @(x) f3(x) / df3(x) ;
df32 = @(x) 6 * x - 11.12;
du = @(x) 1 - df32(x) / df3(x) * u(x) ;
[ x, k, X, FX, KOR ] = newton( u, du, 1.5, 1e-10, 1e-10, 100 );
%x 1.2300, k = 7;





