clear all; close all; clc;

imageName = 'img/cellules.jpg';
I=imread(imageName);
size_I = size(size(I));
if( size(size(I)) == [1,3]),
    I = rgb2gray(I);
end

figure(1);
imshow(I);title('Image originale a niveau de gris');


H= (imhist(I))';

figure(2);
imhist(I);
title('L''histogramme de notre image');
ylabel('Le nombre de pixels');

figure(3);
[s, v]=varInterClass(H);

figure(4);
Ib = im2bw(I, s/255);
imshow(Ib);