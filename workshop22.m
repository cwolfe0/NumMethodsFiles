% Cory Wolfe
%% Heat Generation 
[x1,T1]=ode45(@d2Tdx2,[0 3],[300 0]); 
TL1 = T1(end,1) 
[x2,T2]=ode45(@d2Tdx2,[0 3],[300 10]); 
TL2 = T2(end,1) 
za = 0 + (10-0)/(TL2-TL1)*(250-TL1) 
[x3,T3]=ode45(@d2Tdx2,[0 3],[300 za]); 
TL3 = T3(end,1) 
plot(x3,T3(:,1))
%% Convection 
[x1,T1]=ode45(@ws22,[0 5],[500 0]); 
con1 = (T1(end,1)-200)-T1(end,2) 
[x2,T2]=ode45(@ws22,[0 5],[500 -100]); 
con2 = (T2(end,1)-200)-T2(end,2) 
za = 0 + (-100-0)/(con2-con1)*(0-con1) 
[x3,T3]=ode45(@ws22,[0 5],[500 za]); 
con3 = (T3(end,1)-200)-T3(end,2) 
plot(x3,T3(:,1)) 
%% Simply Supported Beam 
[x1,y1]=rk4sys(@uniformbeam,[0 4],[0 0],0.01,1e6,1e11,5e-4,4); 
yL1 = y1(end,1) 
[x2,y2]=rk4sys(@uniformbeam,[0 4],[0 -0.01],0.01,1e6,1e11,5e-4,4); 
yL2 = y2(end,1) 
za = 0 + (-0.01-0)/(yL2-yL1)*(0-yL1) 
[x3,y3]=rk4sys(@uniformbeam,[0 4],[0 za],0.01,1e6,1e11,5e-4,4); 
yL3 = y3(end,1) 
plot(x3,y3(:,1))
