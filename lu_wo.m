function [L,U] = lu_wo(A) 
[m,n] = size(A); 
if m~=n, error('Matrix must be square'), end 
 L = eye(n); 
for k = 1:n-1
    L(k+1:n,k) = A(k+1:n,k)/A(k,k); 
    for j = k+1:n   
        for i = k+1:n 
            A(i,j) = A(i,j) - L(i,k)*A(k,j); 
        end
    end
end
 U = triu(A); 

