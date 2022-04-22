

x = [0 0.2 0.4 0.6 0.8 1];
f = sin(pi*x);

p = f;

p_0 = pi * cos(pi * x(1));
p_l = pi * cos(pi * x(6));
alpha = komplint(5,x,p,p_0, p_l);


t = [x(1) x(1) x(1) x(1) x(2) x(3) x(4) x(5) x(6) x(6) x(6) x(6)];
xp = linspace(0,1,101);
n = 5; 

for i = 1:101
    yp(i) = deBoor(xp(i),4,n,t,alpha);
end


fplot(@(x) sin(pi * x), [0,1])
hold on
plot(xp, yp, 'r');
hold off