% Cory Wolfe
% Numerical Methods Take Home Final Question

%%a.
%i.
x = 0:1:5;
A = [2.3416,-2,0,0,0;
     -1,2.3416,-1,0,0;
     0,-1,2.3416,-1,0;
     0,0,-1,2.3416,-1;
     0,0,0,-1,2.3416];
b = [79.93;79.93;79.93;79.93;479.93];
T = A\b;
T = [T;400]

%ii.
xb = 0:.25:5;
Ab = eye(20,20);
Ab = Ab.*2.02135;
Ab(1,2) = -2;
Ab(20,19) =-1;
for i=2:1:19
    Ab(i,i-1) = -1;
    Ab(i,i+1) = -1;
end
bb = 4.9956*ones(1,20);
bb(1,20) = bb(1,20)+400;
Tb = Ab\bb';
Tb =[Tb;400] 
%%b.
ts1 = fzero(@res,160);
[xv,yv]=ode45(@dydxn,[0,5],[ts1,0]);
plot(x,T','o',xb,Tb','o',xv,yv(:,1))
legend('Linearized, dx = 1','Linearized, dx = .25','Nonlinear Shooting','Location','Best')