close all; clear all; clc;

x = -1:0.1:1; lx = length(x);
y = -1:0.1:1; ly = length(y);
Im = zeros(lx, ly);
z0 = x' * (1i*y);
z = z0;
k =0;
while(  k < 30)
   z = z - (z.^3 -1) ./ (3*z.^2);
   k = k + 1;
end

col = z0(abs(z.^3 -1) < 0.0001);

xc = real(col);
yc = imag(col);

ax = (lx-1)/2; bx = (lx+1)/2;
ay = (ly-1)/2; by = (ly+1)/2;

Im (ceil ()

