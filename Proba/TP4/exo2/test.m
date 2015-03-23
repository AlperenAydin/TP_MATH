clear all; close all; hold on;

figure(1);
N = 10000;
[X,Y] = loiNormale(N);
scatter(X,Y);

figure(2); hold on; grid on;
k= 100;
x = linspace(-1.5,1.5,k);
h1 = hist(Y,k);

l = h1(k/2);
h = 1/(l *sqrt(2*pi));

bar(x,h1*h/N);

theo = exp(-(x.^2)/2);
theo = theo/(sqrt(2*pi));
plot(x,theo);