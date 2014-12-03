function main()

a=1;
tmin=-5;
tmax=5;

pas=0.1;
t=[tmin:pas:tmax];
f=(porte(t,a))';

i=complex(0,1);
N=length(f);
w = exp(-2*pi*i/N);
FN=ones(N,N); 

for j=0:N-1
    for k=0:N-1
        FN(j+1,k+1)=w^(j*k);
    end 
end


fTF=TFD(f); %fTF=f^

FNinv1 = inv(FN);       %invers de FN qu'on a calcule avec inv
FNinv2= conj(FN) / N;   %invers de FN qu'on a calcule avec conj

figure(1);

l =2; %no of lines
c = 3; %no of lines

subplot(l,c,1);
plot(t,f);

subplot(l,c,2);
plot(t,fftshift(real(fTF))); 

subplot(l,c,3);
plot(t,fftshift(real(fft(f))));

subplot(l,c,4);
plot(t,fftshift(real(fTF))); 

subplot(l,c,5);
plot(t,real(FNinv1*fTF));

subplot(l,c,6);
plot(t,real(ifft(fTF)));

%Comparaison de performance:
t1=linspace(1,20,1); %Performance de TFD
t2=linspace(1,20,1); %Performance de fft
x=[1:20];

for i= 1:20
    pas= 1/i;
    t=[tmin:pas:tmax];
    f=(porte(t,a))';
    
    tic;
    TFD(f); %Performance de TFD
    t1(i)=toc;
    
    tic;
    fft(f); %Performance de fft
    t2(i)=toc;
    
end

figure(2);
subplot(1,2,1);
plot(x,t1);

subplot(1,2,2);
plot(x,t2);
end

function y=porte(t,a)
y=(abs(t)<a/2)/a;
end

function y=TFD(f) %Transforme de fourier discret

i=complex(0,1);
N=length(f);
w = exp(-2*pi*i/N);
FN=ones(N,N); 

for j=0:N-1
    for k=0:N-1
        FN(j+1,k+1)=w^(j*k);
    end 
end

y=FN*f;
end