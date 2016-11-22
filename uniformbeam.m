function dy = uniformbeam(x,y,w,E,I,L) 
dy = [y(2); w/(2*E*I)*(x*L-x^2)]; 
