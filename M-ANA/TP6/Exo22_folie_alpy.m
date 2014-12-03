clear all;close all;
A=imread('barbara.jpg');

[a,b]=size(A);

figure(1);

subplot(2,2,1);
imagesc(A);
colormap ('gray');

TF_A = fftshift(fft2(A));

subplot(2,2,2);
imagesc (log10((abs(TF_A))));


X=1:a;
Y=1:b;
f= 50;

indice_x = find( abs(X -(a/2)) > f  );
lx =length(indice_x);

indice_y = find( abs(Y-(b/2)) > f );
%TF_A (indice_x , indice_y) =0;
ly = length(indice_y);




subplot(2,2,3);
imagesc (log10((abs(TF_A))));

Ar = ifft2(TF_A);
subplot(2,2,4);
imagesc(abs(Ar));




