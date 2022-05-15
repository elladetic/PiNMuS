
format long e;

u = 0:pi/10:pi;
f = @(x)sin(x);

[A, b] = nnk_lin_splajn(u, f);

alfa = A \ b;

sy = alfa;
fplot(f, [0,1])
hold on
plot(u, sy, "r");
hold off

