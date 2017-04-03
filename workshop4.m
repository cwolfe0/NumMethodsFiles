%Workshop #4 - Cory Wolfe
%% Single application of Simpson's 1/3
x = 0:3:6;
y = x.^2;
I = (x(3)-x(1))/6*(y(1)+4*y(2)+y(3));
%% Applying function.
I_f = singleS13(x,y)

x1 = 0:3:6;
y1 = x1.^4;
I_f1 = singleS13(x1,y1)

%% Summation Funtion
sumi2(3)
help sumi2
sumi2(3,2)

%% Plotting Function
figure(1)
plotsinmx(7)
figure(2)
plotsinmx()

%% Piecewise function
piecewise4(-5)
piecewise4(-.25)
piecewise4(1/3)
piecewise4(10)