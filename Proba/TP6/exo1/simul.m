clear all; close all; hold on;

cx = -1:0.1:1;
cy = -1:0.1:1;
[cX,cY] = meshgrid(cx,cy);

M = zeros(21,21);

N = 10000;
[X,Y] = simulation(N);

for i = 1:N
   x = 1+ (floor(10*X(i))) /10; 
   y = 1+ (floor(10*Y(i))) /10;  
    
end