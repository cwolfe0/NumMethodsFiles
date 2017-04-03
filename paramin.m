function [xmin,fmin,ea,iter] = paramin(f,xL,xu,xm,es,maxIt,varargin)
%paramin: minimization using parabolic interpolation
% [xmin,fmin,ea,iter] = paramin(f,xL,xu,es,maxIt,p1,p2,...)
%inputs:
% f = name of function
% xL, xu = lower and upper bounds
% xm = first guess at minimum (default (xL+xu)/2)
% es = desired relative error (default = 0.0001%)
% maxIt = maximum allowable iterations (default = 50)
%outputs:
% xmin = location of minimum
% fmin = minimum function value
% ea = approximate relative error (%)
% iter = number of iterations to find minimum
if nargin<3,error('At least 3 input arguments required'),end
if nargin<4|isempty(xm),xm = (xL+xu)/2;end
if nargin<5|isempty(es),es = .0001;end
if nargin<6|isempty(maxIt),maxIt=50;end
iter = 0;
x4 = xu;
while(1)
    xold = x4;
    iter = iter+1;
    x4 = xm - .5*((xm-xL)^2*(f(xm)-f(xu))-(xm-xu)^2*(f(xm)-f(xL)))/...
        ((xm-xL) * (f(xm)-f(xu))-(xm-xu) * (f(xm)-f(xL)));
   if f(x4) < f(xm)
       xL = xm; xm = x4;
   else
       xu = xm; xm = x4;
   end
   
   if x4~=0, ea = abs((x4-xold)/x4)*100;end
   
   if ea<es|iter>=maxIt,break,end
end
xmin = x4; fmin = f(x4);