% Cory Wolfe
f = @(x) x^6+x^3-10;
clc
%% Manual Evaluation
df_coarse = derfun(f,2,0.5,2,'c')  
df_medium = derfun(f,2,0.25,2,'c') 
df_cm = 4/3 * df_medium - 1/3 * df_coarse 
df_fine = derfun(f,2,0.125,2,'c') 
df_mf = 4/3 * df_fine - 1/3 * df_medium 
df_cmf = 16/15 * df_mf - 1/15 * df_cm 
[fx,ea] = derrich(f,2)
%% Partial Derivatives
g = @(x,y) x^2+2*x*y-y^2;
x = 1; y = 2; h = .5;
dgdx = (g(x+h,y)-g(x-h,y))/(2*h)
dgdy = ( g(x,y+h)-g(x,y-h) ) / (2*h)
d2gdx2 = ( g(x+h,y)-2*g(x,y)+g(x-h,y) ) / h^2 
d2gdy2 = ( g(x,y+h)-2*g(x,y)+g(x,y-h) ) / h^2 
d2gdxy = ( g(x+h,y+h)-g(x+h,y-h)-g(x-h,y+h)+g(x-h,y-h) ) / (4*h^2) 
