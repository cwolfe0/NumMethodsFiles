function T = raditerTH(T) 
n=length(T);% hdx2=h*dx^2; sdx2=s*dx^2; 
for i = 2:n-1 
    
     T(i) = (4.9956+T(i+1)+T(i-1))/(2.02135);
end

