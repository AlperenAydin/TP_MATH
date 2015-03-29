clear all; close all; hold on;

figure(1);
N = 10000;
[X,Y] = loiNormale(N,0,1);
scatter(X,Y);

figure(2); hold on; grid on;

k= 100;
x = linspace(-3,3,k);
h1 = hist(Y,x);

% Une valeur correctif due la comportement de hist.
l = h1(k/2);
h = 1/(l *sqrt(2*pi));

bar(x,h1*h,'-g');

theo = exp(-(x.^2)/2);
theo = theo/(sqrt(2*pi));
plot(x,theo,'-b','LineWidth',2);

title('Loi Normale');
legend('Empirique','Theorique');
xlabel('t');
ylabel('La Probabilite');

Esperance = mean(X)
Ecart = std(X)
