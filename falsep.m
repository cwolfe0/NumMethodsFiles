function [xr, fx, ea, i] = falsep(f,xL,xu,et,maxIt)
% falsep: false position root locator that finds roots between xL and xu
% Inputs:
%   f - function to be evaluated
%   xL, xu - lower and upper bounds, respectively
%   et - maximum allowable error (default 0.0001%)
%   maxIt - maximum number of iterations (default 50)
% Outputs:
%   xr - root found
%   fx - function value at root
%   ea - approximate relative error (%)
%   i  - number of iterations necessary to obtain solution
if nargin<3, error('at least 3 input arguments required'), end
test = f(xL)*f(xu);
if test>0,error('No sign change between f(xL) and f(xu)'),end
if nargin<4|isempty(et), et=0.0001;end
if nargin<5|isempty(maxIt), maxIt=50;end

xr = xL; ea = 100;

for i = 1:maxIt
    xrold = xr;
    xr = xu-f(xu)*(xL-xu)/(f(xL)-f(xu));
    sgnchng = f(xL)*f(xr);

    if sgnchng < 0
        xu = xr;
        ea = abs((xr-xrold)/xr)*100;
    elseif sgnchng > 0
        xL = xr;
        ea = abs((xr-xrold)/xr)*100;
    else
        ea = 0;
    end
        
    if ea<=et, break, end
end

fx = f(xr); 