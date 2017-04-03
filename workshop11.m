%Cory Wolfe

f = @(x) cos(3*x)/(x+1);
I_exact = 0.085473789; 
I1 = trap(f,0,pi,1) % Trap n = 1
I2 = trap(f,0,pi,2) % Trap n=2 
I12 = 4/3*I2-1/3*I1 % O(h^4) 
I4 = trap(f,0,pi,4) % Trap n=4 
I24 = 4/3*I4-1/3*I2 % O(h^4) 
I124 = 16/15*I24-1/15*I12 % O(h^6) 
I8 = trap(f,0,pi,8) % Trap n=8 
I48 = 4/3*I8-1/3*I4 % O(h^4) 
I248 = 16/15*I48-1/15*I24 % O(h^6) 
I1248 = 64/63*I248-1/63*I124 % O(h^8) 
[I_f,ea] = romberg(f,0,pi,[],3)
[I_f2,ea2] = romberg(f,0,pi)
error = abs((I_exact-I_f2)/I_exact)*100 

%% Gauss Quad
a = 0; b = pi;
fd = @(xd) f(((b+a)+(b-a)*xd)/2);
Ig2= (fd(-1/sqrt(3))+fd(1/sqrt(3)))*(b-a)/2 
Ig3= (5/9*fd(-sqrt(.6))+8/9*fd(0)+5/9*fd(sqrt(.6))) *(b-a)/2
I_g2 = GaussQuad(f,0,pi,2) 
I_g3 = GaussQuad(f,0,pi,3) 
I_g8 = GaussQuad(f,0,pi) 

%% Comparison
trap8 = trap(f,0,pi,8);
Etrap8 =  abs((I_exact-trap8)/I_exact)*100;
simp8 = simpson13(f,0,pi,8);  
Esimp8 = abs((I_exact-simp8)/I_exact)*100; 
Egauss8 = abs((I_exact-I_g8)/I_exact)*100; 

fprintf('Method        Result       Error\n') 
fprintf('trap n=8      %.4f       %2.2f\n',trap8,Etrap8)
fprintf('S13 n=8       %.4f       %2.2f\n',simp8,Esimp8) 
fprintf('Romberg       %.4f       %2.2e\n',I_f2,error) 
fprintf('Gauss n=8     %.4f       %2.2e\n',I_g8,Egauss8) 

