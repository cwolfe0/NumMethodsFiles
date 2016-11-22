% Cory Wolfe
clear,clc
f = @(x) x^2/10-2*sin(x);
figure(1),fplot(f,[0,4])
fx = @(x) x/5-2*cos(x);
xmin = fzero(fx,2)
fmin = f(xmin)

%% Golden Section Search
[x,fx] = goldmin(f,0,4)

%% Parabolic Interpolation
[x,fx] = paramin(f,0,4)

%% Comparison of two meathods
tic, [x,fx,ea,iter] = goldmin(f,0,4), toc
tic, [x,fx,ea,iter] = paramin(f,0,4), toc

%% fminbnd with options
options = optimset('display','iter');
[f,fx]=fminbnd(f,0,4,options)