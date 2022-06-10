format long e;

n=2;
m=4;
epsilon = 1e-10;
delta = 1e-10;
N=100;
x0 = [1, 1]';

%%%%%%% DIO A %%%%%%%%%%%%%%%
y=[0.5, 1, 2, 4];
R = @(x) [exp(x(1)-2*x(2))-y(1); exp(x(1)-1*x(2))-y(2); exp(x(1))-y(3); exp(x(1)+1*x(2))-y(4)];
J = @(x) [exp(x(1)-2*x(2)) -2*exp(x(1)-2*x(2));
          exp(x(1)-1*x(2)) -1*exp(x(1)-1*x(2));
          exp(x(1)) 0;
          exp(x(1)+1*x(2)) exp(x(1)+1*x(2))];    
f = @(x) 1/2*R(x)'*R(x);

[ x_gn1, k_gn1, X_gn1, FX_gn1 ] = Gauss_Newton_nelinNK( R, J, x0, n, m, epsilon, delta, N );
[  x_s1, k_s1, X_s1, FX_s1  ] = sekanta_nelinNK(R, J, x0, n, m, epsilon, delta, N);


%%%%%%%% DIO B %%%%%%%%%%%%%%
y=[5, 1, 2, -4];
R = @(x) [exp(x(1)-2*x(2))-y(1); exp(x(1)-1*x(2))-y(2); exp(x(1))-y(3); exp(x(1)+1*x(2))-y(4)];

[ x_gn2, k_gn2, X_gn2, FX_gn2 ] = Gauss_Newton_nelinNK( R, J, x0, n, m, epsilon, delta, N );
[  x_s2, k_s2, X_s2, FX_s2  ] = sekanta_nelinNK(R, J, x0, n, m, epsilon, delta, N);


%%%%%%%% DIO C %%%%%%%%%%%%%%
y=[5,1,2,-40];
R = @(x) [exp(x(1)-2*x(2))-y(1); exp(x(1)-1*x(2))-y(2); exp(x(1))-y(3); exp(x(1)+1*x(2))-y(4)];

[ x_gn3, k_gn3, X_gn3, FX_gn3 ] = Gauss_Newton_nelinNK( R, J, x0, n, m, epsilon, delta, N );
[  x_s3, k_s3, X_s3, FX_s3  ] = sekanta_nelinNK(R, J, x0, n, m, epsilon, delta, N);

