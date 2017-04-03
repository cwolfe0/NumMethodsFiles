function [x,f,ea,iter] = newtmult(func,x0,es,maxIt,varargin)
% newtmult: Newton-Raphson root zeroes nonlinear systems 
%  [x,f,ea,iter]=newtmult(func,x0,es,maxIt,p1,p2,...): 
%   uses the Newton-Raphson method to find the roots of  
%   a system of nonlinear equations 
% input: 
%   func = name of function that returns f and J 
%   x0 = initial guess 
%   es = desired percent relative error (default = 0.0001%) 
%   maxIt = maximum number of iterations (default = 50) 
%   p1, p2, ... = additional parameters used by function 
% output: 
%   x = vector of roots 
%   f = vector functions evaluated at roots 
%   ea = approximate percent relative error (%) 
%   iter = number of iterations for solution 

% Created by: Your name 
% Today's date 

if nargin<3||isempty(es),es = .0001;end
if nargin<4||isempty(maxIt),maxIt = 50;end
iter = 0;x = x0;
while(1)
    [J,f] = func(x,varargin{:});
    dx = J\f;
    x = x-dx;
    iter = iter+1;
    ea = 100*max(abs(dx./x));
    if ea<=es|iter>=maxIt, break, end 
end