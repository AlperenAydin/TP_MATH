close all; clear all; clc


I = imread('piece.jpg');

figure(1);
imagesc(I);
title('Image I originale');

I=rgb2gray(I) ; 
figure(2);
imagesc(I);
colormap ('gray'); 


H=imhist(I);
figure(3); 
stairs(H);
title('Histogramme des NG de I');
xlabel('NG');

s=graythresh(I); 
fprintf('\nValeur de seuil : %f',s) ; 