clear, clc
f = @(x) exp(-x)-x;
fplot(f,[0,1])
%% Fixed-Point Iteration
[xr0,fxr0,ea0] = fixedpt(f,0,[],5)
[xr1,fxr1,ea1] = fixedpt(f,.5,[],5)
[xr,fxr,ea] = fixedpt(f,0)

%% Newton-Raphson Mehtod
df = @(x) -exp(-x)-1;
[root,ea]=newtraph(f,df,0)
%[root,ea]=newtraph(f,df,100)

%% fzero w/ options
options = optimset('display','iter');
[x,fx]=fzero(f,0,options)