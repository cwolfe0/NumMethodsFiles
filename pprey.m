function du = preprey(t,u)
du = [.23*u(1)-.0133*u(1)*u(2);-.4*u(2)+.0004*u(1)*u(2)];