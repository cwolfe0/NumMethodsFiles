% Cory Wolfe
%% Question 1
t = 0:2; dydt = @(t,y) (1-4*t)^2*sqrt(y);
%a.
tx = linspace(0,2);
yx = (1/36)*(-16*tx.^3+12*tx.^2-3*tx+1).^2;
%b.
[te5, ye5] = eulode(dydt, [0 2], 1, .5)
[te25, ye25] = eulode(dydt, [0 2], 1, .25)
%c.
[tm,ym]=heun(dydt, [0 2], 1, .5,[])
%d.
h = .5; i = 1;
y = zeros(3,1); y(1) =1;
k1 = dydt(t(i),y(i));
k2 = dydt(t(i)+0.5*h,y(i)+0.5*k1*h);
k3 = dydt(t(i)+0.5*h,y(i)+0.5*k2*h);
k4 = dydt(t(i)+h,y(i)+k3*h);
phi = (k1+2*k2+2*k3+k4)/6; 
y(i+1) = y(i) + phi*h ;
i=2;
k1 = dydt(t(i),y(i));
k2 = dydt(t(i)+0.5*h,y(i)+0.5*k1*h);
k3 = dydt(t(i)+0.5*h,y(i)+0.5*k2*h);
k4 = dydt(t(i)+h,y(i)+k3*h);
phi = (k1+2*k2+2*k3+k4)/6; 
y(i+1) = y(i) + phi*h 
plot(tx,yx,te5,ye5,'bx',te25,ye25,'o',t,y,'rx',tm,ym,'bo')
%% Question 2
[t1,x1] = ode45(@msd,[0,10],[2,0],[],28,15,100);
[t2,x2] = ode45(@msd,[0,10],[2,0],[],28,60,100);
[t3,x3] = ode45(@msd,[0,10],[2,0],[],28,250,100);
figure(2),plot(t1,x1(:,1))
hold
plot(t2,x2(:,1))
plot(t3,x3(:,1))
hold
legend('c=15','c=60','c=250')
l1 = length(x1);l2 = length(x2);l3 = length(x3);
int15=trapz(t1,x1);
int60=trapz(t2,x2);
int250=trapz(t3,x3);
int15(1)
int60(1)
int250(1)
%% Question 3
[t,u] = ode45(@pprey,[0,47],[563,20]);
data=csvread('population.csv'); 
t2=data(:,1);
t2 = t2-1959;
um = data(:,2);
uw = data(:,3);
intm = trapz(t,u(:,1));
intw = trapz(t,u(:,2));
figure(3),plot(t,u),legend('moose','wolves')
hold
plot(t2,um,'bo',t2,uw,'ro')
hold
figure(4),plot(u(:,1),u(:,2)),xlabel('moose'),ylabel('wolves')