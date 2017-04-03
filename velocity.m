function dz = velocity(t,z0,v0,m,c,g) 
dz = v0*exp(-c*t/m)-m*g/c*(1-exp(-c*t/m));