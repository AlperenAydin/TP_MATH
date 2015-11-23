close all; clear all; clc;

I = imread('formes.png');

figure(1);
imagesc(I);
colormap gray; 
title('Image I originale');

I=imcomplement(I); 
% La commande imcomplement donne le complement de l'image I
figure(2);
imagesc(I); 
colormap gray;
title('Complement de I');

colorbar; 

figure(3); 
imhist(I);
% La commande imhist donne une histogramme 
% de quantités de pixels par niveau de gris
title('Histrogramme de l''image');
xlabel('Niveau en gris');
ylabel('Nombre de pixel');


figure(4)
s=graythresh(I);
% La commande transform une image a niveau a une image binaire
% Tout les pixels au-dessous d'un level sont noir
% Ceux qui sont au-dessus sont blanch
fprintf('\nValeur de seuil : %f \n',s); 
Ib=im2bw(I,s) ;
imagesc(Ib);
colormap gray;
title('Image binaire de I');

figure(5);
Id = bwdist(Ib); % On calcule la carte de la distance de l'image binaire
imagesc(Id);
colormap gray;
title('Carte des distances');