close all; clear all; pause on;

I=imread('particules.png');
imagesc(I); colormap(gray);
figure();
compteur = 1;
while bweuler(I)~=0
    
    I=imopen(I, strel('disk', compteur));
    imagesc(I);colormap(gray);
    pause(0.01);
    nb(compteur)=bweuler(I);
    compteur = compteur+1;
end

l=length(nb);
nb=nb(l:-1:1);

figure();
imagesc(I);

figure();
subplot(2,1,1);
plot(nb);

subplot(2,1,2);
bar(diff(nb));

%Rayon = 1, 11, 15
