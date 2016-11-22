clear,clc
f = @(x) 20*cos(x.^5)./(x+1);
fplot(f,[0,pi/2])
%% Incremental search
[nb,xb] = incsearch(f,0,pi/2)

%% Bisection method
xr1 = bisect(f,0,1.2)
xr2 = bisect(f,1.2,1.4)
xr3 = bisect(f,1.4,pi/2)

%% MATLAB's fzero
r1 = fzero(f,1)
r2 = fzero(f,1.3)
r3 = fzero(f,pi/2)
