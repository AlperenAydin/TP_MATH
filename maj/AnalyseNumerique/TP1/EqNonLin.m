close all; clear all; 

x = [0:0.01:5];
F = 8 - 4.5*(x-sin(x));

plot(x,F);grid on;

