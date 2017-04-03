% Cory Wolfe
%% Three mass system
A = [10,-5,0;-5,10,-5;0,-5,10];x0 = [1;1.5;-1];
[v,e]=eig(A)
C = v\x0
t = linspace(0,20);
x = C(1)*v(:,1)*cos(sqrt(e(1,1))*t)+...
    C(2)*v(:,2)*cos(sqrt(e(2,2))*t)+...
    C(3)*v(:,3)*cos(sqrt(e(3,3))*t);
figure(1)
plot(t,x)
legend('x_1','x_2','x_3','Location','EastOutside')
xlabel('Time [s]'), ylabel('Position [m]')
title('Displacement of three masses')
% Solving Runge-Kutta
[trk,xrk] = ode45(@threemass,[0,20],[1,1.5,-1,0,0,0]);
figure(2);clf;hFig=figure(2);
set(hFig,'Position',[0,0,800,800])
subplot(3,1,1),plot(t,x(1,:),trk,xrk(:,1),'o')
subplot(3,1,2),plot(t,x(2,:),trk,xrk(:,2),'o')
subplot(3,1,3),plot(t,x(3,:),trk,xrk(:,3),'o')
annotation(figure(2),'textbox',[.4,.95,.3,.03],'String',{'Eigen and Runge-Kutta Solutions'});
%% Mass-Spring-Damper
[t1,x1] = rk4sys(@msd2,[0,15],[1,0],.1,20,200,20);
figure(3),plot(t1,x1(:,1))
[t2,x2] = rk4sys(@msd2,[0,15],[1,0],.1,5,200,20);
plot(t2,x2(:,1))
case1 = [0,1;-20/20,-200/20];
case2 = [0,1;-20/5,-200/5];
eig(case1)
eig(case2)
[t2,x2] = rk4sys(@msd2,[0,15],[1,0],.01,5,200,20);
plot(t2,x2(:,1))
%% Max/Min Eigenvalues
B = [-20,4,3,0;4,-10,2,1;3,2,-15,3;0,1,3,5];
[emax,v]=powerm(B)
emin = powerm(B^-1);emin=1/emin
[V,E]=eig(B)