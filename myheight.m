function z = myheight(t,z0,v0,m,c,g)
z = z0 + m/c*(v0+m*g/c)*(1-exp(-c*t/m))-m*g*t/c;