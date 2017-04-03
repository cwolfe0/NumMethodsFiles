%Cory Wolfe
%% Manual RK4
dydt = @(t,y) 4*exp(.8*t)-.5*y;
t = 0:2;h=1
y = zeros(3,1);y(1)=2;
%First time step
i = 1; k1 = dydt(t(i),y(i));
k2 = dydt(t(i)+0.5*h,y(i)+0.5*k1*h); 
k3 = dydt(t(i)+0.5*h,y(i)+0.5*k2*h); 
k4 = dydt(t(i)+h,y(i)+k3*h); 
phi = (k1+2*k2+2*k3+k4)/6; 
y(i+1) = y(i) + phi*h 
%Second time step
i =2; 
k1 = dydt(t(i),y(i));
k2 = dydt(t(i)+0.5*h,y(i)+0.5*k1*h); 
k3 = dydt(t(i)+0.5*h,y(i)+0.5*k2*h); 
k4 = dydt(t(i)+h,y(i)+k3*h); 
phi = (k1+2*k2+2*k3+k4)/6; 
y(i+1) = y(i) + phi*h 
%Exact and Euler
tx = linspace(0,2);
yx = (40*exp(.8*tx)-14*exp(-.5*tx))/13;
[te, ye] = eulode(dydt, [0 2], 2, 1); 
[xe,ue] = eulsys(@ws19_ode,[0 3],[1 1],.1); 
plot(tx,yx,'k',te,ye,'o',t,y,'rx') 
legend('Exact','Euler','RK4','Location','best') 
%% 2nd order ODE 
[x,u] = rk4sys(@ws19_ode,[0 3],[1 1],.1);
xx=linspace(0,3); s7 = sqrt(7)/2; 
ux = xx + (3*cos(s7*xx)+6/7*s7*sin(s7*xx))./(2*exp(xx/2))-0.5; 
plot(xx,ux,'k',xe,ue(:,1),'x',x,u(:,1),'o') 
legend('Exact','Euler','RK4','Location','best') 
fprintf('Exact solution at t=2: %7.4f\n',ux(end))
fprintf('Euler solution at t=2: %7.4f\n',ue(end,1))
fprintf('RK4   solution at t=2: %7.4f\n',u(end,1)) 

