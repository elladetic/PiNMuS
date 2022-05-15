
load primjer_dmnk.mat;

t_1 = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
t_2 = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 1];
t_3 =  sort(x)';


k = 2;
t_1_p = [t_1(1), t_1, t_1(max(size(t_1)))];
t_2_p = [t_2(1), t_2, t_2(max(size(t_2)))];
t_3_p = [t_3(1), t_3, t_3(max(size(t_3)))];
alpha_1_2 = nk_splajn(t_1_p, x,y, k);
alpha_2_2 = nk_splajn(t_2_p,x,y, k);
alpha_3_2 = nk_splajn(t_3_p,x,y, k);

x_ = linspace(0,1,101);
for i = 1:101
    y_(i) = deBoor(x_(i), k, length(t_1_p ) - k, t_1_p, alpha_1_2) ;
end
figure(1)
plot(x,y, "o")
hold on
plot(x_, y_, "r")
hold off

x_ = linspace(0,1,101);
for i = 1:101
    y_(i) = deBoor(x_(i), k, length(t_2_p) - k, t_2_p, alpha_2_2) ;
end
figure(2)
plot(x,y, "o")
hold on
plot(x_, y_, "r")
hold off

x_ = linspace(t_3(1),t_3(20),101);
for i = 1:101
    y_(i) = deBoor(x_(i), k, length(t_3_p) - k, t_3_p, alpha_3_2); 
end
figure(3)
plot(x,y, "o")
hold on
plot(x_, y_, "r")
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 3;
t_1_p = [t_1(1), t_1(1), t_1, t_1(max(size(t_1))), t_1(max(size(t_1)))];
t_2_p = [t_2(1), t_2(1),t_2, t_2(max(size(t_2))), t_2(max(size(t_2)))];
t_3_p = [t_3(1), t_3(1), t_3(1), t_3(3:20) t_3(max(size(t_3))), t_3(max(size(t_3)))]; 

alpha_1_3 = nk_splajn(t_1_p, x, y, k);
alpha_2_3 = nk_splajn(t_2_p, x, y, k);
alpha_3_3 = nk_splajn(t_3_p, x, y, k);


x_ = linspace(0,1,101);
for i = 1:101
    y_(i) = deBoor(x_(i), k, length(t_1_p) - k, t_1_p, alpha_1_3) ;
end
figure(4)
plot(x,y, "o")
hold on
plot(x_, y_, "r")
hold off

x_ = linspace(0,1,101);
for i = 1:101
    y_(i) = deBoor(x_(i), k, length(t_2_p) - k, t_2_p, alpha_2_3) ;
end
figure(5)
plot(x,y, "o")
hold on
plot(x_, y_, "r")
hold off

x_ = linspace(t_3(1),t_3(20),101);
for i = 1:101
    y_(i) = deBoor(x_(i), k, length(t_3_p) - k, t_3_p, alpha_3_3); 
end
figure(6)
plot(x,y, "o")
hold on
plot(x_, y_, "r")
hold off








