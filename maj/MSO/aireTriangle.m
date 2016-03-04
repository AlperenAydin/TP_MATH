close all; clear all; clc;

N = 10;
t = linspace(0,1,N);

denom = 1+t.^2;
x  = (1-t.^2)./denom;
y  = 2*t./denom; 

dx = -4*t./(denom.^2);
dy = 2*(1-t.^2)./(denom.^2);

f = x.*dy - dx.*y;
Aire = 0.5*mean(f);