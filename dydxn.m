function dy = dydxn(x,y)
dy = [y(2);-.05*(200-y(1))-2.7e-9*(200^4-y(1)^4)];