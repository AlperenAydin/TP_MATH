clear all;close all;
A=imread('zebra_b.jpg');
A= A(:,:,1);

[a,b]=size(A);

figure(1);

subplot(2,2,1);
imagesc(A);
colormap ('gray');

TF_A = fftshift(fft2(A));

subplot(2,2,2);
imagesc (log10((abs(TF_A))));

f= 50;
X = 1:a;
indice_x = find( abs(X -(a/2)) > f );
TF_A (indice_x, :) =0;

Y = 1:b;
indice_y = find( abs(Y-(b/2)) > f );
TF_A (: , indice_y) =0;

subplot(2,2,3);
imagesc (log10((abs(TF_A))));

Ar = ifft2(TF_A);
subplot(2,2,4);
imagesc(abs(Ar));




