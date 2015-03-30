clear all; close all; hold on;

cx = -1:0.1:1;
cy = -1:0.1:1;
[cX,cY] = meshgrid(cx,cy);

M = zeros(21,21);

N = 10000;
[X,Y] = simulation(N);
