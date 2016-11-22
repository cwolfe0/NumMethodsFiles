function du = msd(t,u,m,c,k) 
du = [u(2); (sin(t)-c*u(2)-k*u(1))/m]; 
