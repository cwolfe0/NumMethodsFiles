% Cory Wolfe
f = @(x) x^5-x^2+4;
%% Manual evaluation
x = 4; h = .5;
df_f_c = (f(x+h)-f(x))/h % forward
df_b_c = (f(x)-f(x-h))/h % backward
h = .25;
df_f_f = (f(x+h)-f(x))/h % forward finer
df_b_f = (f(x)-f(x-h))/h % backward finer
h = 0.5;      
df_f2_c = (-f(x+2*h)+4*f(x+h)-3*f(x))/(2*h) % Forward O(h2)
df_b2_c = ( 3*f(x)-4*f(x-h)+f(x-2*h))/(2*h) % Backward O(h2)
df_c2_c = ( f(x+h)-f(x-h))/(2*h) % Centered O(h2) 
h = 0.25;      
df_f2_f = (-f(x+2*h)+4*f(x+h)-3*f(x))/(2*h) % Forward O(h2)
df_b2_f = ( 3*f(x)-4*f(x-h)+f(x-2*h))/(2*h) % Backward O(h2)
df_c2_f = ( f(x+h)-f(x-h))/(2*h) % Centered O(h2) 
%% Truncation Error
exact = 1272;
E_f_c = abs(exact-df_f_c);
E_f_f = abs(exact - df_f_f);   
E_f2_c = abs(exact - df_f2_c);  
E_f2_f = abs(exact - df_f2_f); 
fprintf('True Error\n') 
fprintf('          O(h)     O(h2)\n') 
fprintf('Coarse  %.2f     %.2f\n',E_f_c,E_f2_c) 
fprintf('Fine    %.2f     %.2f\n',E_f_f,E_f2_f) 
fprintf('\nTrue Relative Error\n') 
fprintf('         O(h)     O(h2)\n') 
fprintf('Coarse   %.2f     %.2f\n',E_f_c/exact,E_f2_c/exact)
fprintf('Fine     %.2f     %.2f\n',E_f_f/exact,E_f2_f/exact)
%% Using derfun
df_f_c
derfun(f,4,.5,1,'f')
df_b2_c
derfun(f,4,.5,2,'b')
df_c2_f
derfun(f,4,.25,2,'c')
help derfun
