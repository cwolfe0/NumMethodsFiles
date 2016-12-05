function [emax,v] = powerm(A,et,maxIt)
n = length(A);
v = ones(n,1);emax=1;
for i =1:maxIt
    eold=emax;
    v = A*v;
    [~,loc]=max(abs(v));
    emax=v(loc);
    v = v/emax;
    ea = abs((emax-eold)/emax)*100;
    if ea<=et,break,end
end