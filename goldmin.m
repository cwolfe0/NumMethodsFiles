function [x,fx,ea,iter] = goldmin(f,xL,xu,es,maxIt,varargin)
%goldmin: minimization golden section search
% [x,fx,ea,iter] = goldmin(f,xL,xu,es,maxIt,p1,p2,...)
%   uses golden section search to find the minimum of f
%inputs:
% f = name of function
% xL, xu = lower and upper bounds
% es = desired relative error (default = 0.0001%)
% maxIt = maximum allowable iterations (default = 50)
%outputs:
% x = location of minimum
% fx = minimum function value
% ea = approximate relative error (%)
% iter = number of iterations to find minimum

% Created by: Cory Wolfe
% 2016-09-22

if nargin<3, error('At least 3 input arguments required'),end
if nargin<4|isempty(es),es=0.0001;end
if nargin<5|isempty(maxIt),maxIt=50;end

iter = 0;
phi = (1+sqrt(5))/2;
while(1)
    d = (phi-1)*(xu-xL);
    x1 = xL+d; x2 = xu-d;
    if f(x1,varargin{:}) < f(x2,varargin{:})
        xopt = x1;xL=x2;
    else
        xopt = x2;xu=x1;
    end
    iter = iter+1;
    if xopt~=0,ea=(2-phi)*abs((xu-xL)/xopt)*100; end
    if ea<=es | iter>=maxIt,break,end
end
x = xopt;fx=f(x,varargin{:});

