function T = raditer(T,Tinf,dx,h,s) 
n=length(T); hdx2=h*dx^2; sdx2=s*dx^2; 
for i = 2:n-1 
     T(i) = (hdx2*Tinf+sdx2*(Tinf^4-T(i)^4)+T(i-1)+T(i+1))/(2+hdx2);
end

