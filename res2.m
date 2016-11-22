function r = res2(za) 
[n,f] = ode45(@Blasius, [0 6], [0 0 za]); 
r = f(end,2)-1; 
