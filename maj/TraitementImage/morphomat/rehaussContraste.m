close all; clear all; clc;


%% Ici on essaye de augmenter le contraste de l'image
I =imread('angiogram.png');

B= strel('disk', 5, 8);
IT = imtophat(I, B);


subplot(1,2,1);
imagesc(I);
colormap(gray); title('Image avant tophat');

subplot(1,2,2);
imagesc(IT);
colormap(gray); title('Image apres tophat');

%% Reponse
% L'operation tophat garde les maximas locaux, qui sont plus petit que B
% (qui contient pas B)