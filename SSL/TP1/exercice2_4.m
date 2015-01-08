clear all;close all; hold on;

tmin = 0; tmax= 10;
pas= 0.01;
t=(tmin:pas:tmax-pas);
n = length(t);

tau =0.2;
p = zeros(1,n); % p pour peigne de dirac

indices_diracs=find( mod(t,tau) == 0 );
p (indices_diracs) = 1;

subplot(2,1,1);
stem(t,p)
grid on;


P = fft(p); P = fftshift(P);
N= length(P);
Fe = 100;
f = (-N/2 : N/2-1 ) *Fe/N ;
subplot(2,1,2);
stem(f,abs(P));


