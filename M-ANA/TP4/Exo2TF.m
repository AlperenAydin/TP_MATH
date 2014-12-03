function main ()
clear all;
close all;
hold on;

tmin=-5;tmax=5;pas=0.1;
t=[tmin:pas:tmax];
n=length(t);

f0=(1+t.^2).^(-1);
f=f0+0.05*randn(1,n)

figure(1);
plot(t,f)

N=5;
fr=zeros(5, n);

for i=1:N
    fr(i,:)= ifft(fft(f).*sinc(t));
end

figure(2);
plot(t,real(fr));


end

function y=porte(t,a)
y=(abs(t)<a/2)/a;
end