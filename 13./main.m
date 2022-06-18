

format long e;

epsilon = 1e-6;
r0 = 1;
N = 100;
x0 = [1,1,1,1,1]';
dim = 5; %imam 5 varijabli 


[x, k, kbm, X, G] = kaznena_funkcija(@F, @dF, @d2F, @g, x0, r0, dim, epsilon, N);
kbm




