% Cory Wolfe
%% Plane with Generation
x = .5:.5:2.5;
b = -5000*sin(x)*.5^2/60;
b(1) = b(1)-300;
b(end) = b(end) -250;
A = gallery('tridiag',ones(4,1),-2*ones(5,1),ones(4,1));
T = A\b'
plot(x,T)
x = [0,x,3]; T=[300;T;250];
[xs,Ts] = ode45(@d2Tdx2, [0 3],[300 62.7467]);
plot(x,T,'o',xs,Ts(:,1)), legend('FD','Shoot') 
%% Falling Again 
dt = 3;g=9.81;c=12.5;m=70;
b = g*dt^2*ones(3,1);
b(1) = b(1)-0;
b(end) = b(end) - (1+c*dt/(2*m))*500;
C = (1-c*dt/(2*m))*ones(2,1);  
D = -2*ones(3,1);    
E = (1+c*dt/(2*m))*ones(2,1); 
A3 = gallery('tridiag',C,D,E); 
 x = A3\b 
t=0:dt:12; x=[0;x;500]; 
[ts,xs] = ode45(@falling, [0 12],[0 22.7224]); 
plot(t,x,'o',ts,xs(:,1)), legend('FD','Shoot') 
%% Radiation 
dx=.1; x=0:dx:10; n=length(x); 
Tinf=100; h=0.15; s=2.7e-9; 
T = zeros(n,1); T(1)=500; T(end)=400; 
T = raditer(T,Tinf,dx,h,s);
while(1) 
    Told=T; 
    T=raditer(T,Tinf,dx,h,s); 
    ea=max(abs((T-Told)/T)*100); 
    if ea<0.001, break, end 
end
za = fzero(@res1,-60); 
[xs,Ts]=ode45(@radiation,[0 10],[500 za]); 
plot(x,T,'o',xs,Ts(:,1))
legend('FD','Shooting') 
%% 2D Slab 
A = zeros(8);     
A(1,1)=-4; A(1,2)=1; A(1,5)=1; 
A(2,1)=1; A(2,2)=-4; A(2,3)=1;A(2,6)=1; 
A(3,2)=1; A(3,3)=-4; A(3,4)=1; A(3,7)=1;
A(4,3)=2; A(4,4)=-9; A(4,8)=1; 
A(5,1)=2; A(5,5)=-4; A(5,6)=1; 
A(6,2)=2; A(6,5)=1; A(6,6)=-4; A(6,7)=1;
A(7,3)=2; A(7,6)=1; A(7,7)=-4; A(7,8)=1;
A(8,4)=2; A(8,7)=2; A(8,8)=-9;  
b=-500*[2;1;1;4;1;0;0;3]; 
T = A\b 
x=0:0.25:1; y=x; 
[X,Y]=meshgrid(x,y); 
Tplot=zeros(5); 
Tplot(:,1)=500;Tplot(:,5)=500;Tplot(1,:)=500; 
Tplot(2:5,2)=T(1:4);Tplot(2:5,4)=T(1:4); 
Tplot(2:5,3)=T(5:8); 
contourf(X,-Y,Tplot) 
colorbar 
xlabel('X [m]'), ylabel('Y [m]') 
