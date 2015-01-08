clear all;
close all;
hold on; 
 
t=[-2*pi:0.01:2*pi]';
n=length(t);
S=zeros(n,3);
A=4/pi;
N=1000;

for k=0:N
    k2=2*k+1;
    S(:,1) = S(:,1) + sin(k2*t)/k2;
    S(:,2) = S(:,2) + cos(k2*t)/(k2^2);
    S(:,3) = S(:,3) + sin(k2*t)/(k2^3); 
end

S=S.*A;
S(:,1)=-S(:,1);

figure(1);

hold on;
plot(t,[S(:,1),S(:,2),S(:,3)]);

nbHarm=5;
h=[1:nbHarm]';
n=length(h);
nu=h/(2*pi)
An=zeros(n,3);
An(:,1) = A./(2*h+1);
An(:,2) = A./((2*h+1).^2);
An(:,3) = A./((2*h+1).^3);

figure(2);

subplot(1,3,1);
bar(nu,An(:,1),0.2);
title('Spectre de f1');

subplot(1,3,2);
bar(nu,An(:,2),0.2);

subplot(1,3,3);
bar(nu,An(:,3),0.2);


