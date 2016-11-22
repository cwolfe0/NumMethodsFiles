% Cory Wolfe

%% Manual iterations 
i1 = 0; i2 = 0; i3 = 0; 
% First Iteration 
i1 = (10+5*i3)/9 
i2 = (-2+12*i3)/20 
i3 = (5*i1+12*i2)/20 
% Begin Second Iteration 
iold = [i1;i2;13];
i1 = (10+5*i3)/9   
i2 = (-2+12*i3)/20  
i3 = (5*i1+12*i2)/20 
error_approx = abs((i1-iold(1))/i1)*100
% Begin Third Iteration 
iold = [i1;i2;13];
i1 = (10+5*i3)/9   
i2 = (-2+12*i3)/20  
i3 = (5*i1+12*i2)/20 
error_approx = abs((i1-iold(1))/i1)*100
error_approx = abs((i2-iold(2))/i2)*100
% Begin Fourth Iteration 
iold = [i1;i2;13];
i1 = (10+5*i3)/9   
i2 = (-2+12*i3)/20  
i3 = (5*i1+12*i2)/20 
error_approx = abs((i1-iold(1))/i1)*100
error_approx = abs((i2-iold(2))/i2)*100
% Begin Fifth Iteration 
iold = [i1;i2;13];
i1 = (10+5*i3)/9   
i2 = (-2+12*i3)/20  
i3 = (5*i1+12*i2)/20 
error_approx = abs((i1-iold(1))/i1)*100
error_approx = abs((i2-iold(2))/i2)*100
% Begin Sixth Iteration 
iold = [i1;i2;13];
i1 = (10+5*i3)/9   
i2 = (-2+12*i3)/20  
i3 = (5*i1+12*i2)/20 
error_approx = abs((i1-iold(1))/i1)*100
error_approx = abs((i2-iold(2))/i2)*100
% Begin Seventh Iteration 
iold = [i1;i2;13];
i1 = (10+5*i3)/9   
i2 = (-2+12*i3)/20  
i3 = (5*i1+12*i2)/20 
error_approx = abs((i1-iold(1))/i1)*100
error_approx = abs((i2-iold(2))/i2)*100   
error_approx = abs((i3- iold(3))/i3)*100 
iexact = [9 0 -5; 0 20 -12; -5 -12  20]\[10;-2;0] 
iapprox = [i1;i2;i3] 
%% Using GaussSeidel Function  
A=[9 0 -5; 0 20 -12; -5 -12 20]; b=[10 -2 0]; 
ifun = GaussSeidel(A,b,[],7) 
ifun2 = GaussSeidel(A,b) 
%% Nonlinear
[x,f,ea,iter] = newtmult(@ws17,[3;3])