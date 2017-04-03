function [xr, fx, ea,i] = riddlers(f, xL, xu, et, maxit)
% Inputs:
% f - function to be evaluated
% xL, xu - lower and upper bounds, respectively
% et - maximum allowable error
% maxit - maximum iterations
% Outputs:
% xr - root found
% fx - function value at root
% ea - approximate relative error (%)

% Created by: Cory Wolfe
% 2016 - 09 - 20

xr = xL; ea = 100;

for i = 1:maxit
    xrold = xr;
    xm = (xL+xu)/2;
    xr = xm + (xm-xL)*((sign(f(xL)-f(xu)).*f(xm))/(sqrt((f(xm))^2-f(xL).*f(xu))));
    sgnchng = f(xL) * f(xr);
    if sgnchng<0
        xu = xr;
        ea = abs((xr-xrold)/xr)*100;
    elseif sgnchng>0
        xL = xr;
        ea = abs((xr-xrold)/xr)*100;
    else ea=0
    end
    if ea<et
        break
    end
end
fx = f(xr);