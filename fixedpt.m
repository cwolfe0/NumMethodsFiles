function [xr,fxr,ea]=fixedpt(f,x0,et,maxIt)
%fixedpt: Fixed-point iteration root locator
% [xr,fxr,ea]=fixedpt(f,x0,et,maxIt):
%   uses simple fixed-point iteration method to find the root of f
%input:
% f = name of function
% x0 = initial guess
% et = desired relative error (default = 0.0001%)
% maxIt = maximum allowable iterations (default = 50)
%output:
% xr = location of root
% fxr = function value at determined root
% ea = approximate relative error (%)

% Created by: Cory Wolfe
% 2016-09-20

if nargin<2, error('At least 2 input arguments required'), end
if nargin<3|isempty(et),et=.0001;end
if nargin<4|isempty(maxIt),maxIt = 50; end

xi = x0; g = @(x) f(x)+x;
for i=1:maxIt
    xip1 = g(xi);
    ea = abs((xip1-xi)/xip1)*100;
    if ea<et,break,end
    
    xi = xip1;
end
xr = xip1;
fxr = f(xr);
