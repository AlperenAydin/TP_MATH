clear all; close all; clc;

figure(1);
i = imread('img/ngc2175.jpg');
imagesc(i);
title('Image originale');


[H, W] = size(i);
[U, V]=meshgrid(-W/2+1/2:W/2-1/2, -H/2+1/2:H/2-1/2);

D = sqrt( U.^2 + V.^2);

D0= 3;
n = 2;
HButter = 1./(1 + (D0./D).^2*n);

figure(2);
plot3(U,V,HButter);
title('La distance a (0,0)');

I= fftshift(fft2(i));

IF = HButter .* I;

iF = abs((ifft2(IF)));

figure(3);
imagesc(iF);