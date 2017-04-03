function plotsinmx(m)
%   Inputs m = mode
if nargin<1||isempty(m),m=1;end
x = linspace(0,2*pi,24*m+1);
y = sin(m*x);
plot(x,y)

end

