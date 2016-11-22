function f = piecewise4(x)
if x<=-1
    f = 0;
elseif x<=0
    f = x+1;
elseif x<=1
    f = -x+1;
else
    f = 0;
end