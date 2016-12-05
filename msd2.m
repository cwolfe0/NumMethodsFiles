function du = msd2(t,u,m,c,k)
du = [u(2);(-c*u(2)-k*u(1))/m];