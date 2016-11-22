function I = simpson13(func,a,b,n)
% Application of the simpson13 rule 
%  Simpson13:  composite simpson13 rule
%   I=Simpson13(func,a,b,n):
%        composite trapezoidal rule
% input:
%   func=name of function to be integrated
%   a,b=integration limits
%   n=number of segments (default=100)
% output:
%   I=integral estimate

% Created by: Cory Wolfe
% Date: 2016-10-04
if nargin<4||isempty(n)
n=100;
elseif mod(n,2)>0
error('Number of segments should be multiple of 2')
end


x = a; h = (b-a)/n; m = n/2;
s = 0;
for i=1:m
s = s + func(x) + 4*func(x+h) + func(x+2*h);
x = x + 2*h;
I = (b-a)*s/(3*n);
end
