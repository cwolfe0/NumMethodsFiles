function dx = threemass(t,x)
dx = [x(4);x(5);x(6);-10*x(1)+5*x(2);
    5*x(1)-10*x(2)+5*x(3);5*x(2)-10*x(3)];
