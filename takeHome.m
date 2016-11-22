% Take-Home Problem for MAE 284 Midterm
% Cory Wolfe
%%a.
f = @ (x,y) x.^3 + 4.*x.^2.*y.^2 - y.^3;
a = 0;b=3;c=-1;d=2;
[X,Y] = meshgrid(0:.1:3,-1:.1:2);
Z = f(X,Y);

surf(X,Y,Z)

%%b.
fya = @(y) -y^3; %x=0
fyd = @(y) 3^3+4*3^2*y^2-y^3; %x=3
fyb = @(y) 1+4*y^2-y^3; %x=1
fyc = @(y) 2^3+4*2^2*y^2 - y^3; %x=2
Int1 = 3/8*(fya(c)+3*fya((2*c+d)/3)+3*fya((c+2*d)/3)+fya(d));
Int2 = 3/8*(fyb(c)+3*fyb((2*c+d)/3)+3*fyb((c+2*d)/3)+fyb(d));
Int3 = 3/8*(fyc(c)+3*fyc((2*c+d)/3)+3*fyc((c+2*d)/3)+fyc(d));
Int4 = 3/8*(fyd(c)+3*fyd((2*c+d)/3)+3*fyd((c+2*d)/3)+fyd(d));
Intsimp = 3/8*(Int1+3*Int2+3*Int3+Int4)

TempAveSimp = Intsimp/((d-c)*(b-a))%i
trap1 = 3*(f(0,-1)+2*f(1.5,-1)+f(3,-1))/4;
trap2 = 3*(f(0,.5)+2*f(1.5,.5)+f(3,.5))/4;
trap3 = 3*(f(0,3)+2*f(1.5,3)+f(3,3))/4;
IntTrap = 3*(trap1+2*trap2+trap3)/4 %ii.
Error = abs((Intsimp-IntTrap)/Intsimp)*100;