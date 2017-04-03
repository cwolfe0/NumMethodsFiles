%% if statement
clc
% n = input('Numerator: ');
% d = input('Denominator: ');
n = 5; d = 0;
if d ==0
    frac = 'Cannot divide by zero';
else
    frac = n/d;
end

frac

%% Summation i^2
n = 4;
s = 0;
for i=1:n
    s = s+i^2;
end
s

%% Season Evaluator
n = 6;
if n ==1 | n ==2 | n == 3
    season = 'Winter';
elseif n ==4 | n ==5 | n ==6
    season = 'Spring';
elseif n ==7 | n==8 | n ==0
    season = 'Summer';
elseif n ==10 | n==11 | n==12
    season = 'Fall';
else
    season = 'There is no month with that number';
end
season

%% Piecewise Function
x = .5;
if x<=-1
    f = 0;
elseif x<=0
    f = x+1;
elseif x<=1
    f = -x+1;
else
    f = 0;
end
fprintf('At %f the function value is %f\n',x,f)