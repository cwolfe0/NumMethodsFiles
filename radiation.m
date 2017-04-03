function dT = radiation(x,T) 
dT = [ T(2); 0.15*(T(1)-100)+2.7e-9*(T(1)^4-100^4)]; 
