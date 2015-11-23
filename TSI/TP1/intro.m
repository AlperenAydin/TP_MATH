close all; clear all; clc;


%% Image I

I = imread('cell.tif');
figure(1);
imagesc(I);
title('Image I originale');
colorbar; 

sizeI = size(I)

%% Image Ic

Ic = imread('fabric.png');
figure(2);
imagesc(Ic);
title('Image Ic originale');

sizeIc = size(Ic) 

%% Image Ing

Ing =rgb2gray(Ic) ; 

figure(3);
imagesc(Ing);
colormap ('gray'); 