close all; clear all; clc;

figure();
Im = imread('1.tif');
[x,y] = size(Im);
l = x*y;
D = zeros(6,l);

for i = 1:6
    Im = imread([num2str(i),'.tif']);
    D(i,:) = Im(:);
    subplot(3,2,i);
    imshow(Im);
end

D = D';
moy = mean(D);
moys = ones(l,1)*moy; 
variance = std(D);
variances = ones(l,1)*variance;

D0 = (D-moys)./variances;

T = D0'*D0;

[VecP,ValP] = eig(T);
Vx = VecP(:,end); Vy = VecP(:,1);

X = D0*Vx; Y = D0*Vy;

Ifx = reshape(X,x,y); Ify = reshape(Y, x,y);

figure();
for i=1:6
    V = VecP(:,i);
    I = reshape(D0*V,x,y);
    subplot(2,3,i);
    imshow(I,[min(min(I)), max(max(I))]);
    title([num2str(i),'ieme Vec Propre']);
end

figure();
imshow(I,[min(min(I)), max(max(I))]);
    



