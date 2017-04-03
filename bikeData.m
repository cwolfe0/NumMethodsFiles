% This m-file will be used to plot and process the raw data from
% the bike's data.
M = csvread('bike.csv');
t0 = M(1,1);
M(:,1) = M(:,1)-t0;
% for(i = 1:length(M))
%     if(M(i,2) ~=0)
%         M(i,2) = 0;
%     else
%         M(i,2) = 1;
%     end
% end
plot(M(:,1),M(:,3))
hold
plot(M(:,1),M(:,4))