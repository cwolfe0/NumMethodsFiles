function [root,ea,iter] = newtraph(func,dfunc,xr,es,maxIt,varargin)
%newtraph: Newton-Raphson root location zeroes
% [root,ea,iter]=newtraph(func,dfunc,xr,es,maxIt,p1,p2,...):
%   uses Newton-Raphson method to find the root of func
%input:
% func = name of function
% dfunc = name of derivative of function
% xr = initial guess
% es = desired relative error (default = 0.0001%)
% maxIt = maximum allowable iterations (default = 50)
% p1, p2, ... = additional parameters used by function
%output:
% root = real root
% ea = approximate relative error (%)
% iter = number of iterations

% Created by: Cory Wolfe
% 2016-09-20

if nargin<3,error('Ar least 3 input arguments required'),end
if nargin<4|isempty(es),es=.0001;end
if nargin<5|isempty(maxIt),maxIt=50;end
iter = 0;
while(1)
    xrold = xr;
    xr = xr-func(xr)/dfunc(xr);
    iter = iter+1;
    
    if xr ~=0,ea = abs((xr-xrold)/xr)*100;end
    if ea<=es|iter>=maxIt,break,end
end
root = xr;