function [x] = cramers(A,b)
% Function to solve [A]{x}={b} via Cramer's rule
% [x] = cramers(A,b) 
% Inputs: 
%   A - coefficient matrix 
%   b - RHS vector 
% Outputs: 
%   x - solution vector 

% Created By: Cory Wolfe
% 2016-10-20

[m,n]=size(A);
p = length(b); 
if m~=n|n~=p, error('Size of A must be square and same length a b'), end 
z = zeros(n,1);
detA = det(A);
for i = 1:n
    Bi = A;
    Bi(:,i) = b;
    x(i) = det(Bi)/detA;
end