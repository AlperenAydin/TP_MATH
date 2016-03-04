clear all; close all;

I=imread('des.jpg');
figure(1);
imagesc(I); colormap(gray);
taille=25;

%B=strel('line', taille,90);
B=strel('disk', 8);

IE = imerode(I, B);
figure(2);
imagesc(IE);

IM = imreconstruct(IE,I);

figure(3);
imagesc(IM); colormap gray;

% IC = IM-I;
% figure(4);
% imagesc(IC); colormap gray;

