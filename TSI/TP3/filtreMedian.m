clear all; close all; clc;

A = imread('img/phare_bruit_ps.png');
L = 3;
order = 1+((L^2)-1)/2;
B1 = ordfilt2(A,order,true(L));
B2 = ordfilt2(B1,order,true(L));

figure;
imshow(A);
title('L''image originale');

figure; 
imshow(B1);
title(['L''image filtre mediane une fois avec L =',num2str(L)]);

figure;
imshow(B2);
title(['L''image filtre mediane deux fois avec L =',num2str(L)]);