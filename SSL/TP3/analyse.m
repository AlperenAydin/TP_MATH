function [y,spectre,Fe]=analyse(son,debut)


[x,Fe]=audioread(son);

subplot(2,2,1);
plot(x);

Nbr_ech = 4000; 
y = x(debut:debut+Nbr_ech);

subplot(2,2,2);
plot(y);

N = 8192 ;

spectre = fft(y,N);

subplot(2,2,[3,4])
plot(abs(spectre(1:N/2)));
end