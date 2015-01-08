function main()

i=complex(0,1);
N=50;
w = exp(-2*pi*i/N);
FN=ones(N,N); 

for j=0:N-1
    for k=0:N-1
        FN(j+1,k+1)=w^(j*k);
    end 
end

f=zeros(N,1);
for k=0:N-1
    f(k+1)=nchoosek(N-1,k);
end

fTF=FN*f; %fTF=f^

FNinv1 = inv(FN);%invers de FN qu'on a calcule avec inv
FNinv2= conj(FN) / N; %invers de FN qu'on a calcule avec conj

figure(1);

l =2; %no of lines
c = 3; %no of lines

subplot(l,c,1);
plot(f);

subplot(l,c,2);
plot(fftshift(abs(fTF))); 

subplot(l,c,3);
plot(fftshift(abs(fft(f))));

subplot(l,c,4);
plot(fftshift(abs(fTF))); 

subplot(l,c,5);
plot(abs(FNinv1*fTF));

subplot(l,c,6);
plot(abs(ifft(fTF)));

end