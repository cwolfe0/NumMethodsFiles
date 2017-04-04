% This m-file will be used to plot and process the raw data from
% the bike's data.
M = csvread('bike.csv');
t0 = M(1,1);
M(:,1) = M(:,1)-t0;
plot(M(:,1),M(:,3))
hold
plot(M(:,1),M(:,4))
hold off
legend('Total Distance (ft)','RPM');
title('Plot of RPM and Total Distance');
xlabel('Time (ms)');
ylabel('Total Distance(ft) and RPM');