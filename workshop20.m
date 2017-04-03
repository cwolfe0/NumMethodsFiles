% Cory Wolfe
%% Part I
tspan = [0,5];y0=.01;
dydt = @(t,y) exp(-(t-2)^2/.002)-y;
[tcoarse, ycoarse] = rk4sys(dydt,tspan,y0,.125); 
[tfine, yfine] = rk4sys(dydt,tspan,y0,.0162); 
[t45,y45] = ode45(dydt,tspan,y0); 
 plot(tcoarse,ycoarse,'k<-',tfine,yfine,'rx-',t45,y45,'bo')
 legend('ode45','coarse','fine')
 dt_min=min(diff(t45)), dt_max=max(diff(t45)) 
%% Mass-Spring-Damper 
[t1,x1] = ode45(@msd,[0 40],[1 0],[],2,1,1); 
figure(1), plot(t1,x1(:,1)) 
[t2,x2] = ode45(@msd,[0 40],[1 0],[],2,0,1); 
[t3,x3] = ode45(@msd,[0 40],[1 0],[],1,0,1); 
figure(2), plot(t1,x1(:,1),'k',t2,x2(:,1),'r', t3,x3(:,1),'b') 
axis([0 40 -3 3]) 
legend('Case 1','Undamped','Resonance','Location','best') 
 figure(3) 
subplot(2,2,1), plot(x1(:,1),x1(:,2)) 
subplot(2,2,2), plot(x2(:,1),x2(:,2))
subplot(2,2,3), plot(x3(:,1),x3(:,2)) 
subplot(2,2,4), plot(x1(:,1),x1(:,2),'k',x2(:,1),x2(:,2), 'b',x3(:,1),x3(:,2),'r') 
 axis([-5 5 -5 5]) 
%% Pred-Prey 
[t,u] = ode45(@predprey,[0 20],[2 1]); 
figure(4), plot(t,u), legend('rabbits','foxes') 
figure(5), plot(u(:,1),u(:,2)),xlabel('rabbits'),ylabel('foxes') 
[t,u] = ode45(@predprey,[0 20],[15 1]); 
