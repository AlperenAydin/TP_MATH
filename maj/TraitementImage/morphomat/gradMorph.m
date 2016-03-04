close all; clear all; clc;

figure(1);
subplot(1,2,1);
I = imread('Ampoule.gif');
imagesc(I);
title('Image Original');
colormap(gray);

BO = strel('square',10);
IO = imopen(I,BO);
subplot(1,2,2);
imagesc(IO);
title('Image Corrigé'); colormap(gray);




B = strel('disk',5, 4);

gradInt = I - imerode(I,B);
gradExt = imdilate(I,B) - I;
gradSym = gradExt-gradInt;

figure(2);
subplot(3,2,1);
imagesc(gradInt);
title('Gradient Interieur original');colormap(gray);


subplot(3,2,3);
imagesc(gradExt);
title('Gradient Exterieur original');colormap(gray);


subplot(3,2,5);
imagesc(gradSym);
title('Gradient Symétrisé original');colormap(gray);

gradIntO = IO - imerode(IO,B);
gradExtO = imdilate(IO,B) - IO;
gradSymO = gradExtO-gradIntO;

figure(2);
subplot(3,2,2);
imagesc(gradIntO);
title('Gradient Interieur corrigé');colormap(gray);


subplot(3,2,4);
imagesc(gradExtO);
title('Gradient Exterieur corrigé');colormap(gray);


subplot(3,2,6);
imagesc(gradSymO);
title('Gradient Symétrisé corrigé');colormap(gray);


