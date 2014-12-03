clear all ;close all;
n=500;
m=n;
R = 0.5*m/2;
M=zeros(n,m);
for p=1:m
    for q=1:n
        M(p,q)=(((p-m/2)^2 +(q-n/2)^2 )^ 0.5) < R ;
    end
end
TF_M_real = uint8(abs(fftshift(fft2(M))));

subplot(1,2,1);
imshow(M);

subplot(1,2,2);
imshow(TF_M_real);