% Cory Wolfe

%% Cramer's Rule
A = [1,5;-2,-7];b=[7;5];
B1=A; B2=A; B1(:,1)=b; B2(:,2)=b; 
x1=det(B1)/det(A), x2 = det(B2)/det(A) 
xsol = cramers(A,b)
%% Naïve Gauss Elimination 
aug = [A,b]  
factor = aug(2,1) / aug(1,1); 
aug(2,:) = aug(2,:) - factor * aug(1,:) 
factor = aug(1,2) / aug(2,2);      
aug(1,:) = aug(1,:) - factor * aug(2,:) 
aug(2,:) = aug(2,:) / aug(2,2) 
xsol2 = aug(:,3) 

%% Gauss Elimination using function
 xsol3 = GaussNaive(A,b) 
%% Timing
A4 = [4,2,3,-1;2,-1,2,1;1,3,-1,3;-1,2,1,1];
b4 = [19;5;-1;7];
tic
cramers(A4,b4)
toc
tic
GaussNaive(A4,b4)
toc