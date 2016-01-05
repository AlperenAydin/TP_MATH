clear all; close all; clc; pause on; 

I=imread('piece.jpg');
size_I = size(size(I));
if( size(size(I)) == [1,3]),
    I = rgb2gray(I);
end
    
figure(1);
imshow(I);

H = (imhist(I))'; 
eT = sum(H);
m = (H/eT)*(1:256)';
v = zeros(1,255);

for s=1:255
    figure(2);
    subplot(2,1,1);
    J = im2bw(I,s/256);
    pause(0.001);
    imshow(J);
    title(['Image binaire seuille avec une seuil de ',num2str(s) ]);
    
    subplot(2,1,2);
    HG = H(1:s); eG = sum(HG);  mG = (HG/eG)*(1:s)';
    HD = H(s+1:256); eD = sum(HD); mD = (HD/eD)*(s+1:256)';
    v(s) = (eG/eT)*((mG-m)^2) + (eD/eT)*((mD-m)^2);    
    plot((1:255),v);
    title('La variance interclasse');
    xlabel('Le seuil');
    ylabel('La variance');
    
end

[vm,s] = max(v);
s_theorique = graythresh(I);