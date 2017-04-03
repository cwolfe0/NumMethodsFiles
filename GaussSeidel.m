function [x] = GaussSeidel(A,b,es,maxIt)
% GaussSeidel: Gauss Seidel method 
%   x = GaussSeidel(A,b): Gauss Seidel without relaxation 
% input: 
%   A = coefficient matrix 
%   b = right hand side vector 
%   es = stop criterion (default 0.00001%) 
%   maxIt = max iterations (default 50) 
% output: 
%   x = solution vector 

% Created by: Cory Wolfe
% 2016-10-27
if nargin<2, error('at least 2 input arguments required'),end
if nargin<3||isempty(es),es = .00001;end
if nargin<4||isempty(maxIt),maxIt = 50;end

[m,n] = size(A); p = length(b);
if m~=n|n~=p, error('[A] must be square and {b} must be same length '), end 
C = A;
x = zeros(n,1);
d = x;
iter = 0;
for i = 1:n     
 C(i,i) = 0;    
 d(i) = b(i)/A(i,i); 
 C(i,1:n)=C(i,1:n)/A(i,i);    
end 
while(1)
    xold = x; iter = iter+1; 
    for i = 1:n 
        x(i) = d(i)-C(i,:)*x; 
        if x(i) ~=0           
            ea(i) = abs((x(i)-xold(i))/x(i))*100; 
        end 
    end
    if max(ea)<=es | iter>=maxIt, break,end
end
