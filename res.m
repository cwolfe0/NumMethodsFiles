function r = res(za)
[t,y] = ode45(@dydxn,[0,5],[za,0]);
r = y(length(y))-400;