A=[1 -1 4; 2 8 2; 0 5 2] 
B = [A eye(3)] 
%% Row operations 
 f21 = B(2,1) / B(1,1); 
 B(2,:) = B(2,:) - f21*B(1,:) 
 f32 = B(3,2) / B(2,2); 
 B(3,:) = B(3,:) - f32*B(2,:); 
B(2,:) = B(2,:) / B(2,2); B(3,:) = B(3,:)/B(3,3) 
f23 = B(2,3) / B(3,3); 
B(2,:) = B(2,:) - f23 * B(3,:) 
f13 = B(1,3) / B(3,3);  
B(1,:) = B(1,:) - f13*B(3,:) 
B(1,:) = B(1,:) + B(2,:) 
 Ainv = B(:,4:6) 
format shorte  
A*Ainv 
format short
%% LU Factorization 
[L,U]=lu_wo(A) 
f21, f32 
b = [15;40;18]; 
x = U\(L\b) 
b2 =[11;18;11]; 
x2 = U\(L\b2) 
 %% LU Problem 
C = [3 2 1; 6 4 3; 1 2 9]; b3=[12;25;10];  
[L,U] = lu_wo(C) 
[L,U,P] = lu(C) 
x3 = U\(L\(P*b3)) 
%% Cholesky 
D = [10 2 4; 2 15 1; 4 1 20]; 
u = chol(D) 
u'*u 
