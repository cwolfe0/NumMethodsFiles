function [t,y] = heun(func,tspan,y0,h,epsL,maxIt) 

if nargin<4,error('At least 4 input arguments required'),end 
if nargin<5|isempty(epsL),epsL=0.0001;end  
if nargin<6|isempty(maxIt),maxIt=50;end  
if tspan(2)<tspan(1),error('ti must be less than tf'),end 

t = (tspan(1):h:tspan(2))'; 
if t(end)<tspan(2), t(end+1)=tspan(2); end 
 n = length(t); 
y = zeros(n,1); y(1)=y0; 
for i = 1:n-1 
yi =y(i); 
ti = t(i); tip1 = t(i+1);  dt = tip1 - ti; 
ypi = func(ti,yi); 
y0ip1 = yi + ypi * dt; 
for j = 1:maxIt 
ypip1 = func(tip1,y0ip1); 
ybar = ( ypi + ypip1 )/2; 
yjip1 = yi + ybar * dt; 
diff = abs((yjip1 - y0ip1)/yjip1) * 100; 
if diff<=epsL, break, end 
 y0ip1 = yjip1; 
end
y(i+1) = yjip1; 
end