%% Cory Wolfe
% Defining variables
L = 400;
E = 50000;
I = 30000;
w0 = 2.5;
x = linspace(0,400,41);
% Defining quantities along x-axis.
y = (w0/(120*E*I*L))*(-x.^5+2*L^2*x.^3-L^4*x); %force
slope = (w0/(120*E*I*L))*(-5*x.^4+6*L^2*x.^2-L^4); %slope
moment = E*I*((w0/(120*E*I*L))*(-20*x.^3+12*L^2*x)); %moment
shear = E*I*((w0/(120*E*I*L))*(-60*x.^2+12*L^2)); %shear

% Plotting needed graphs.
subplot(2,2,1);
plot(x,y)
title('Displacement')
xlabel('Distance (cm)')
ylabel('Beam Deflection(cm)')
subplot(2,2,2);
plot(x,slope,'go')
title('Slope')
xlabel('Distance (cm)')
ylabel('Slope(°)')
subplot(2,2,3);
plot(x,moment,'c*')
title('Moment')
xlabel('Distance (cm)')
ylabel('Moment(kN*cm)')
subplot(2,2,4);
plot(x,shear,'r:')
title('Shear')
xlabel('Distance (cm)')
ylabel('Shear(kn/cm^2)')

%% #2
data2 = [.035,.0001,10,2;.020,.0002,8,1;.015,.0010,20,1.5;.030,.0007,24,3;.022,.0003,15,2.5];
data2 = data2';
vel = [sqrt(data2(1,2))/data2(1,1)*((sqrt(data2(1,3))*data2(1,4))/(data2(1,3)+2*data2(1,4)))^(2/3);sqrt(data2(2,2))/data2(2,1)*((sqrt(data2(2,3))*data2(2,4))/(data2(2,3)+2*data2(2,4)))^(2/3);sqrt(data2(3,2))/data2(3,1)*((sqrt(data2(3,3))*data2(3,4))/(data2(3,3)+2*data2(3,4)))^(2/3);sqrt(data2(4,2))/data2(4,1)*((sqrt(data2(4,3))*data2(4,4))/(data2(4,3)+2*data2(4,4)))^(2/3)]

%% #3
t = linspace(10,80,8);
Q = [3.2,4.8,6,6,6.9,7.3,7.5,7.9];
Tt = linspace(0,100);
TQ = 8*(1-exp(-Tt/20));
figure
plot(t,Q,'ro',Tt,TQ,'g--')
legend('data','model')

%% #4 is in a separate m-file.


