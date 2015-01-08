clear all ;close all;
n=300;
m=n;
M=zeros(n,m);
for p=floor(0.25*n):floor(0.75*n)
    for q=floor(0.25*m):floor(0.75*m)
        M(p,q)=1;
    end
end
TF_M_real = uint8(abs(fftshift(fft2(M))));

subplot(1,2,1);
imshow(M);

subplot(1,2,2);
imshow(TF_M_real);