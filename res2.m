function r = res2(za,t0) 
[x,y] = ode45(@dydxn,[0,5],[t0 za]);
r = y(length(x),1)-400;
