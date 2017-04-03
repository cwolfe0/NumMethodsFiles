% Cory Wolfe
clc
%% Question 1
ans1 = zeros(3,5);
total = 0;
for i=0:4
    total = total + (.25^i)/factorial(i);
    ans1(1,i+1) = total;
    ans1(2,i+1) = exp(.25)-total;
    if i==0
        ans1(3,i+1) = 100;
    else
        ans1(3,i+1) = ((ans1(1,i+1)-ans1(1,i))/ans1(1,i+1))*100;
    end
    end
fprintf('Number of terms  Estimate      True error    APRE\n')
fprintf('%1.0f                %12.10f  %12.10f  %12.10f\n',1,ans1(1,1),ans1(2,1),ans1(3,1))
fprintf('%1.0f                %12.10f  %12.10f  %12.10f\n',2,ans1(1,2),ans1(2,2),ans1(3,2))
fprintf('%1.0f                %12.10f  %12.10f  %12.10f\n',3,ans1(1,3),ans1(2,3),ans1(3,3))
fprintf('%1.0f                %12.10f  %12.10f  %12.10f\n',4,ans1(1,4),ans1(2,4),ans1(3,4))
fprintf('%1.0f                %12.10f  %12.10f  %12.10f\n',5,ans1(1,5),ans1(2,5),ans1(3,5))

%% Question 2
x = linspace(12,15,1000);
f2 = @(x) 80*(tan((pi/180).*x))-(9.81./(2*40^2*cos((pi/180).*x)))*80^2+1.5-1;
plot(x,f2(x)), grid on
% Bisect
Bisection = bisect(f2,10,15)
% fzero
Fzero = fzero(f2,13)

%% Question 3
f3 = @(x) exp(x)-25;
% Riddler's
[ridRoot,ridFunc,ridARE,ridIter] = riddlers(f3,0,20,.00001,1000)
[biRoot,biFunc,biARE,biIter] = bisect(f3,0,20,.00001);
[falRoot,falFunc,falARE,falIter] = falsep(f3,0,20,.00001,1000);
fprintf('Riddlers Iterations  Bisect Iterations  Falsep Iterations\n')
fprintf('%2i                   %2i                 %2i\n',ridIter,biIter,falIter)