function du = predprey(t,u) 
du = [ 1.2*u(1)-0.6*u(1)*u(2);-0.8*u(2)+0.3*u(1)*u(2)]; 
