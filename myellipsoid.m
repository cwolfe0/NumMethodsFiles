function myellipsoid(a,b,plot_title)
% Volume of horizontal ellipsoid
% Inputs:
% a: vertical semiaxis
% b: horisontal semiaxis
% plot_title: string holding plot title
h = linspace(0,2*a,10000);
V = (pi/3).*(3*a-h).*(((b^2).*h.^2)/a^2);
figure
plot(h,V)
title(plot_title)