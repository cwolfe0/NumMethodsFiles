function I = trap(func,a,b,n,varargin)

x = a; h = (b-a)/n;
s = func(a,varargin{:});
for i = 1:n-1
    x = x+h;
    s = s+2*func(x,varargin{:});
end
s = s+func(b,varargin{:});
I = (b-a)*s/(2*n);