clear all; close all; hold on; grid on;

n = 50000;
lambda = 3;

absX = 0:0.05:2;
Xe = simulationExp(lambda,n);
b1 = hist(Xe,absX);
bar(absX,b1*20/n,0.5,'b');

a = 1/log(6);
Xt = lambda* exp(-lambda .* absX);
plot(absX,Xt);
title('Comparaison des densités de probabilité théorique et empirique');
legend('Empirique','Theorique');
xlabel('x');
ylabel('Densite de probabilite');

moyExp = mean(Xe);
ecartExp = std(Xe);
