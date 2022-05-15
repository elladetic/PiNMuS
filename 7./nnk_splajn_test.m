f = @(x) sin(x);

u=0:pi/10:pi;

[A,b]=nnk_lin_splajn(u, f);


alfa = A \ b
% izracunat fi
k = 2;
n = max(size(u));
t = zeros(1,n+2);
t(1)=u(1);
t(2:n+1)=u;
t(n+2)=u(n);
sy=zeros(n,1);


figure()
fplot(f,[0 pi],'r-');
hold on;
plot(u,alfa,'b-o');
hold off;
legend('f','sy');