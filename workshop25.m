% Cory Wolfe
%% Positive Definite
A = [5,4,7;4,9,1;7,1,3];
%u = chol(A)
eig(A)
A = A +4*eye(3);
eig(A)
u = chol(A)
%% IVP with Eig
B = [1,2;3,2];
eig(B)
[V,D] = eig(B)
C = V\[0;4]
u = @(t) C(1)*exp(-t)*V(1,1)+C(2)*exp(4*t)*V(1,2);
v = @(t) C(1)*exp(-t)*V(2,1)+C(2)*exp(4*t)*V(2,2);
u(0),v(0)
[t45,x45] = ode45(@dxdt,[0,1],[0,4]);
teig = linspace(0,1);
figure(1)
subplot(2,1,1),plot(teig,u(teig),t45,x45(:,1),'o')
legend('eigen','ode45','Location','best')
title('u(t)')
subplot(2,1,2),plot(teig,v(teig),t45,x45(:,2),'o')
legend('eigen','ode45','Location','best')
title('v(t)')
%% Eats
d = [.3,.2;.7,.8];
x = zeros(2,10);x(:,1)=[1000;0];
for i = 1:9
    x(:,i+1) = d*x(:,i);
end
x
figure(2)
plot(1:10,x),legend('Steak-Out','Venice')
xlabel('Week'),ylabel('Visitors')
[V,d] = eig(d)
1000*V(:,2)/sum(V(:,2))
%% Orthogonality of Eigenvectors
[V,D] = eig(A);
V(:,1)'*V(:,2)
dot(V(:,1),V(:,3)),dot(V(:,2),V(:,3))