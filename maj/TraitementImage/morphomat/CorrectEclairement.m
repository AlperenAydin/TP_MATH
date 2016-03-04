close all; clear all; clc;


%% Ici on essaye de corriger le derive d'eclairementx
I = imread('rice.jpg');
I =rgb2gray(I);

B= strel('disk',20, 8);
IT = imtophat(I, B);


subplot(1,2,1);
imagesc(I);
colormap(gray); title('Image avant tophat');

subplot(1,2,2);
imagesc(IT);
colormap(gray); title('Image apres tophat');

figure();
[H, W] = size(IT);
pas = 4;
IT_sous = double(IT(1:pas:H, 1:pas:W));
surfc(IT_sous);