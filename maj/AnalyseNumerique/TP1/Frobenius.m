close all; clear all; clc; hold on;

p = [1, -3, 1, +3, -2];

P = @(x) (polyval(p,x));

x = linspace(-100,100, 100);
plot(x, P(x)); grid on;

A = compan(p);
r = eig(A);

plot(r,zeros(1,length(r)), 'r*');

epsilon = 1e-6;
if( sum(p-poly(r)) < epsilon )    
    disp('Ca marche!!!');
end