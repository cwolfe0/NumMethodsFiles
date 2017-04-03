function [J,f] = ws17(x)
deL = 1e-8;
df1dx1 = (u(x(1)+deL,x(2))-u(x(1),x(2)))/(deL);
df1dx2 = (u(x(1),x(2)+deL)-u(x(1),x(2)))/(deL);
df2dx1 = (v(x(1)+deL,x(2))-v(x(1),x(2)))/(deL);
df2dx2 = (v(x(1),x(2)+deL)-v(x(1),x(2)))/(deL);
J = [df1dx1 df1dx2; df2dx1 df2dx2];
f1 = u(x(1),x(2));
f2 = v(x(1),x(2));
f = [f1; f2];

function f = u(x,y)
f=sin((x-y)/2)-2*x; 

function f = v(x,y)
f=cos((x+y)/2)-2*y; 


