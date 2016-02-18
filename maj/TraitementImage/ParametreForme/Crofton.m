close all; clear all; clc; pause on;

%%Creation d'un Ellipse
[X,Y] = meshgrid(1:64, 1:64);
a = 60/2; b = round(45/2);

epsilon = 5e-2;
ind = find( ((X-32)/a).^2 + ((Y-32)/b).^2 <= 1);

%%Creation de l'image
Im = zeros(64);
Im(ind) = 1;
subplot(2,1,1);
imshow(Im); hold on;

N = 50;
angles = 360*rand(1,N);

dist = [];
for k=1:length(angles)
    subplot(2,1,2);
    Il = imrotate(Im, angles(k));
    imshow(Il);
    pause(0.01);
    
    %%recherche des extremités de la forme
    ind = find(Il == 1); 
    [I,J] = ind2sub(size(Il),ind);
    i1 = min(I);
    i2 = max(I);
    dist = [dist,i2-i1];
end


PeriCalc = pi*mean(dist);
PeriApprox = 2*pi*sqrt(0.5*( a^2 + b^2));
erreur = abs(PeriApprox-PeriCalc)/PeriApprox;
