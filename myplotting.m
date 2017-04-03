%% Cory Wolfe
x = linspace(-5,5);
y = x.^2;
x2 = linspace(0,5,1000);
y2 = 20*cos(x2.^5)./(x2+1);
figure(1)
plot(x,y,x2,y2)
legend('$y_1=x^2$','$y_2=\frac{20cos(x^5)}{x+1}$','Location','best');
set(legend,'interpreter','latex');
title('My first plot'); xlabel('x');ylabel('y_1,y_2');

%% Creating a second figure
figure(2)

% Creating a grix in x&y
x3 = -2*pi:pi/8:2*pi;y3=-2*pi:pi/8:2*pi;
[X3,Y3]=meshgrid(x3,y3);

% Defining the z values for each x&y
Z3 = sin(sqrt(X3.^2+Y3.^2))*exp(-(X3.^2+Y3.^2));
surfc(X3, Y3, Z3);
view(-63.1,10.8)

%% Concentration
t = linspace(0,10);
c1 = .01./(10./t+t);
c2 = .3-.0025*erf(t-2);
figure(3)
[ax,p1,p2]=plotyy(t,c1,t,c2);
title('Concetration Levels');
xlabel('time [s]');
ylabel(ax(1), 'c_1');
ylabel(ax(2), 'c_2');
legend('c_1','c_2')
set(p1,'LineStyle',':','LineWidth',2)
set(p2,'LineStyle','-.','LineWidth',2)
