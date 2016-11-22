function [df,ea,iter] = derrich(f,x,h,es,maxIt)
% derrich: Richardson's Extrapolation for derivative 
%   df = derrich(f,x,h,es,maxIt) 
% 
% inputs: 
%   f = function to differentiate 
%   x = location to evaluate derivative 
%   h = first step size to evaluate (default = 1) 
%   es = desired relative error (default = .000001%) 
%   maxIt = maximum allowable iterations (default = 50) 
% outputs: 
%   df = estimate of derivative 
%   ea = approximate relative error 
%   iter = number of iterations 

% Created by: Cory Wolfe
% 2016-10-18
 if nargin<2, error('At least 2 input arguments required'), end 
 if nargin<3||isempty(h), h=0.000001; end 
 if nargin<4||isempty(es), es=0.000001; end 
 if nargin<5||isempty(maxIt), maxIt=50; end 

 D(1,1) = derfun(f,x,h,2,'c');
 iter = 0;
 while iter>maxIt
     iter = iter+1;
     dx = h*2^-iter;
     D(iter+1,1)=derfun(f,x,dx,2,'c');
     for k = 2:iter+1
         j = 2+iter-k;
         D(j,k) = (4^(k-1)*D(j+1,k-1)-D(j,k-1))/(4^(k-1)-1); 
     end
     ea = abs((D(1,iter+1)-D(2,iter))/D(1,iter+1))*100;
     if ea<es, break;end
 end
 df = D(1,iter+1);
 ea = 0;
 