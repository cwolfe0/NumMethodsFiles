% Cory Wolfe
%% Question 1
%a.
x = linspace(1,2);
ya = x.^-1.5+x.^-.5*8.88178*10^-16;
%b.
xb = [1,1.2,1.4,1.6,1.8,2];
yb = eye(6,1);
yb(1) = 1;
yb(2) = (yb(1)+3*-1.5*.2*1.2)/1.75
yb(3) = (yb(2)+3*-1.5*.2*1.4)/1.75
yb(4) = (yb(3)+3*-1.5*.2*1.6)/1.75
yb(5) = (yb(4)+3*-1.5*.2*1.8)/1.75
yb(6) = (yb(5)+3*-1.5*.2*2)/1.75
%c.
[xc,yc] = ode23s(@eulercauchy,[1,2],[1,-1.5])
plot(x,ya)
hold
plot(xb,yb)
plot(xc(:,1),yc(:,1))
hold
legend('Analytical','Implicit Euler','MATLAB Solver')
%% Question 2
%a.
[x1,T1]=ode45(@d2Tdx2hw,[0 10],[50 0]); 
TL1 = T1(end,1) ;
[x2,T2]=ode45(@d2Tdx2hw,[0 10],[50 10]); 
TL2 = T2(end,1) ;
za = 0 + (10-0)/(TL2-TL1)*(400-TL1) ;
[x3,T3]=ode45(@d2Tdx2hw,[0 10],[50 za]); 
TL3 = T3(end,1) ;
plot(x3,T3(:,1));
hold
%b.
dx = 2; x2b = 0:dx:10;
b = .1*x2b*2^2.*ones(1,6);
b(2) = b(2)+50; b(5) = b(5)-1.5*400;
b =[100.8000,1.6000,2.4000,-596.8000];
C = .5*ones(3,1); D = -2*ones(4,1); E = 1.5*ones(3,1);
A = gallery('tridiag',C,D,E);
T = A\b';
T = [50;T;400];
plot(x2b,T,'o')
legend('Shooting','Finite')
hold
%% Question 3
%a.
%fzero(@res,10) not sure why this doesn't work.
% Get this error:
%
% Error using fzero (line 301)
% FZERO cannot continue because user-supplied function_handle ==> res failed with the error below.
% 
%  D2YDX2HW returns a vector of length 3, but the length of initial conditions vector is 2. The vector returned by D2YDX2HW
%  and the initial conditions vector must have the same number of elements.
% 
% Error in hw6 (line 48)
% fzero(@res,10)
%b.
x = 0:.25:2;
b = 10*.25^2*ones(7,1);
b(1) = b(1)+30; b(end) = b(end)-3*70;
A = gallery('tridiag',3*ones(6,1),-2*ones(7,1),-1*ones(6,1));
T = A\b;
T = [50,T',400];
plot(x,T,'o')
legend('Finite Difference')