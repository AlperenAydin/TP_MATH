close all; clear all; clc; 

I = imread('piece.jpg');

figure(1);
imagesc(I);
size(size(I))
title('Image I originale');

I=rgb2gray(I) ; 
figure(2);
imagesc(I);
title('Image I niveau de gris');
colormap ('gray'); 


H=imhist(I);
figure(3); 
stairs(H);
title('Histogramme des NG de I');
xlabel('NG');

figure(4);
s=graythresh(I); 
fprintf('\nValeur de seuil : %f \n',s) ; 

Ib = imcomplement(im2bw(I,s));
imshow(Ib);
title(['Image binaire avec une seuil de ',num2str(s)]);

figure(5);
r = 1;
se = strel('disk',r);
Id = imdilate(Ib,se);

subplot(2,2,1);
imshow(Id); title(['Image erode avec une disque de rayon ',num2str(r)]);

Ide = imerode(Id,se);

subplot(2,2,2);
imshow(Ide); title(['Image erode puis dilate avec une disque de rayon ',num2str(r)]);

subplot(2,2,[3,4]);
If = imclose(Ib,se);
imshow(If);title(['Image ferme avec une disque de rayon ',num2str(r)]);


% Nous allons comparer Iold et I new jusqu'ils sont stable
[h, l] = size(If);
Marqueur = zeros(h,l);
Marqueur(1,(1:l)) = 1; Marqueur(h,(1:l)) = 1;
Marqueur((1:h),1) = 1; Marqueur((1:h),l) = 1;

Iold = If .* Marqueur;
Inew = imdilate(Iold,se);
Inew = If .* Inew; 
pause on;

while sum(sum(Inew-Iold)) > 0
    Iold = Inew;
    Inew = imdilate(Iold,se);
    Inew = If .* Inew;
    
    Irc = If- Inew;
    
    figure(6);
    subplot(2,1,1);
    imshow(Inew);
    subplot(2,1,2);
    imshow(Irc);
    pause(0.001);
end    


i = 1;
[L,  m(1)] = bwlabel(Irc,4);
I_erode = Irc;

while m > 0
   i=i+1;
   I_erode = imerode(I_erode,se);
   [L, m(i)] = bwlabel(I_erode,4);
   
   figure(7);
   subplot(3,2,1);
   imshow(Irc);
   
   subplot(3,2,2);
   imshow(I_erode);  
   
   subplot(3,2,[3,4]);
   plot(1:i,(m)); 
   axis([ 1  i+1 0 m(1)+1 ]);
   xlabel('Le nombre d''erosions');
   ylabel('Le nombre des objets')
   
   gran = diff( fliplr(m));
   subplot(3,2,[5,6]);
   l = length(gran);
   bar(1:2:2l,gran);
   pause(0.01);
end

