% Cory Wolfe
%% Falling Problem 
[t1,x1] =ode45(@falling,[0 12],[0 0]); 
xL1 = x1(end,1) 
[t2,x2] =ode45(@falling,[0 12],[0 10]); 
xL2 = x2(end,1) 
za = 0+(10-0)/(xL2-xL1)*(500-xL1) 
[t3,x3]=ode45(@falling,[0 12],[0 za]); 
xL3 = x3(end,1) 
%% Rod with Radiation 
[x1,T1]=ode45(@radiation,[0 10],[500 0]); 
TL1 = T1(end,1) 
[x2,T2]=ode45(@radiation,[0 10],[500 -100]); 
TL2 = T2(end,1) 
za = 0 + (-100-0)/(TL2-TL1)*(400-TL1) 
[x3,T3]=ode45(@radiation,[0 12],[500 za]); 
TL3 = T3(end,1) 
za = fzero(@res1,-60) 
[x4,T4]=ode45(@radiation,[0 10],[500 za]); 
TL4 = T4(end,1) 
plot(x4,T4(:,1)) 
%% Blasius Flat Plate 
za = fzero(@res2,1) 
[n,f] = ode45(@Blasius, [0 6], [0 0 za]); 
 plot(n,f,'LineWidth',3) 
legend('f','f''','f''''','Location','Best') 
xlabel('\eta') 

