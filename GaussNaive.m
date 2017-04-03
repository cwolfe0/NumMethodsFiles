function [x] = GaussNaive(A,b)
% GaussNaive: Naive Gauss elimination 
%   x = GaussNaive(A,b): Gauss Elimination without pivoting 
% input: 
%   A = coefficient matrix 
%   b = right hand side vector 
% output:   
%   x = solution vector 

% Created by: Cory Wolfe
% 2016-10-20

[m,n]=size(A);
p = length(b); 
if m~=n|n~=p, error('Size of A must be square and same length a b'), end 
np1 = n+1; 
Aug = [A,b]; 
% forward elimination 
for k = 1:n-1 
    for i = k+1:n 
        factor = Aug(i,k) / Aug(k,k); 
        Aug(i,k:np1) = Aug(i,k:np1) - factor * Aug(k,k:np1); 
    end
end
% backward elimination 
x(n,1) = Aug(n,np1) / Aug(n,n); 
for i = n-1:-1:1 
    x(i) = (Aug(i,np1)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i); 
end
