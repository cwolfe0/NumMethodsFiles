function T = hw6iter(T,dx,x) 
n=length(T); 
for i = 2:n-1 
     T(i) = -(((5*(T(i+1)-T(i-1)))/2*dx+.1*x)*dx^2-T(i-1)-T(i+1))/2
end

