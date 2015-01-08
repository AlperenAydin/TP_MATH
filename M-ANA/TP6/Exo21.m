clear all;close all;
n= 300;
m=n;
[x,y]=meshgrid(1:n,1:m);

v = [0.1,0.25,0.5,1];
l = length(v);

for i = 1:l
    v1 =v(i);
    v2 =v1;
    M=cos(v1*x+v2*y); % Le signal bi-dimensionel
    subplot(2,l,i);
    imshow(M);
    t = sprintf('%.2f', v1);
    title(t);
    
    TF_M_real = uint8(abs(fftshift(fft2 (M)))); % Convertir en espace de Fourier
    %uint8 car imshow accepte de 0 a 255 
    subplot(2,l,l+i);
    imshow(TF_M_real);
    title(t);

end