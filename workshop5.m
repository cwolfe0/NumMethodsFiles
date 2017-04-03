%Workshop #5 - Cory Wolfe
%%  Roundoff Error
format long
sumdemo
%% Maclaurin
x = 1; % evaluate e^x
sum = 0;
for i = 0:9
    sum = sum + x^i/factorial(i);
end
sum
true_error = exp(1) - sum
true_percent_relative_error = true_error / exp(1) * 100

%% Taylor Expansion
f = @(x) x^5-2*x^3+2;
fp = @(x) 5*x^4-6*x^2;
fpp = @(x) 20*x^3-12*x;
fppp = @(x) 60*x^2 -12;
fpppp = @(x) 120*x;
fppppp = @(x) 120;
h = 2; a = zeros(6,1);
a(1) = f(1);                                %0-order
a(2) = f(1)+fp(1)*h;                        %first-order
a(3) = f(1)+fp(1)*h+fpp(1)/2*h^2;           %second-order
a(4) = a(3) + fppp(1)/factorial(3)*h^3;     %third-order
a(5) = a(4) + fpppp(1)/factorial(4)*h^4;    %fourth-order
a(6) = a(5) + fppppp(1)/factorial(5)*h^5;   %fifth-order
fprintf('     Order     Approx  True Error\n')
for i=1:6
    fprintf('%9.2f %9.2f %11.2f\n',i,a(i),abs(a(i)-f(3)))
end
%% Difference Approximations
f = @(x) sin(x);
x = pi/2; h = pi/8;

% Forward
fpforh = (f(x+h)-f(x))/h;
fpforh2 = (-f(x+2*h)+4*f(x+h)-3*f(x))/(2*h);

% Backward
fpbackh = (f(x)-f(x-h))/h;
fpbackh2 = (3*f(x)-4*f(x-h)+f(x-2*h))/(2*h);

% Centered
fpcenth2 = (f(x+h)-f(x-h))/(2*h);
fpcenth4 = (-f(x+2*h)+8*f(x+h)-8*f(x-h)+f(x-2*h))/(12*h);
fprintf('           Forward  Backward  Centered\n')
fprintf('O(h)    %9.2f %9.2f      ---\n',fpforh,fpbackh)
fprintf('O(h^2)  %9.2f %9.2f %9.2f\n',fpforh2,fpbackh2,fpcenth2)
fprintf('O(h^4)       ---       ---  %9.2f\n',fpcenth4)
