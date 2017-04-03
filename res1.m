function r = res1(za) 
[x,T]=ode45(@radiation,[0 10],[500 za]);
r = T(end,1)-400; 
