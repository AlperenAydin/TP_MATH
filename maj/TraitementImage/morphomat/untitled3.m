close all; clear all; clc;


I = imread('blobs2.png');
figure();
imagesc(I);

figure();
map_I = bwdist(I);
imagesc(map_I);

I_max = imextendedmax(map_I, 1);
figure();
imagesc(I_max);
h=30;

IM=imreconstruct(map_I,map_I+h);
maxima=map_I+h-IM;
figure;imagesc(maxima); 