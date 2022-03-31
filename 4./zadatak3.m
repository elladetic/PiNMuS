
[U,S,V] = svd(A);
n_A = size(A,2);
p = [2,4,8,14,24,36,51,68,78,121];
n_p = size(p,2); %x je 1x10

rez=[];
resreg=[];
normreg=[];

x_p = zeros(n_A,n_p); %svaki x mi je u jednom stupcu
errors = [];
residuals = [];

for i = 1:n_p
  U_= U(:,1:p(i));
  V_= V(:,1:p(i));
  S_= S(1:p(i),1:p(i));

  x_p(:, i) = V_ *   inv(S_) *   transpose(U_) * b;
  errors(i) = norm(x_p - x,2);
  residuals(i) = norm(A*x_p-b,2);

  plot(x_p)
  plot(x);
end

%koji p je najbolji?
plot(x_p)
legend ({"p=2", "p=4", "p=8", "p=14", "p=24","p=36", "p=51", "p=68", "p=78", "p=121"}, "location", "northeast");
x_opt_best = x_p(:, 3); %OVO NISAM SIGURNA KOJI JE NAJBOLJI!!
%nije mi jasan bas ovaj graf

%usporedba s regularizacijom lambda naj
lambda = 77.5;
A_lambda =[A; lambda*eye(n_A,n_A)];
b_lambda =[b; lambda*zeros(n_A,1)];

[U_lambda,S_lambda,V_lambda] = svd(A_lambda,'econ');

tmp = S_lambda\((U_lambda')*b_lambda);
x_lambda = V_lambda * tmp;

%usporedba:
norm(x_lambda-x, 2); %0.014884368370384
norm(A*x_lambda-b,2); %17.835509106442768
norm(x_opt_best-x, 2); %13.414383736270988
norm(A*x_opt_best-b,2); %1.082432969871217e+05

% dodaj komentar jel ovo bolje ili ne kad skuzis koji p gledas, ali navodno
% je bolje kao? 

%crtanje L krivulje i provjera jel tocka na rubu
x_L = [];
errors_L = [];

for p = 1:n_A
  U__ = U(:,1:p);
  V__ = V(:,1:p);
  S__ = S(1:p,1:p);

  H = diag(S__).^(-1);
  xpom=diag(H)*(U__')*b;
  x_lambda = V__ * xpom;

  errors_L(p) = norm(A*x_lambda-b,2);
  x_L(p) = norm(x_lambda, 2);
end

plot(log10(errors_L),log10(x_L));

plot(log10(norm(A*x_opt_best-b,2)), log10(norm(x_opt_best,2)), "*")

