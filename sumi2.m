function s = sumi2(imax,istep)
%Computes the summation of i^2 from 1 to imax
% Inputs:
%     imax = maximum
%     istep = increment size (Default 1)
% Outputs:
%     s = summation
if nargin<2||isempty(istep),istep = 1; end
s = 0; % Initialize s
for i = 1:istep:imax
    s = s+i^2;
end
