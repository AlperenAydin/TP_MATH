clear all; close all; hold on; grid on;

n = 50000;

absX = -3:0.1:2;
Xe = simulation1(n);
b1 = hist(Xe,absX);
bar(absX,b1*10/n,0.5,'b');

a = 1/log(6);
Xt = a ./ (absX+4);
plot(absX,Xt);
title('Comparaison des densités de probabilité théorique et empirique');
legend('Empirique','Theorique');
xlabel('x');
ylabel('Densite de probabilite');

moyExp = mean(Xe);
ecartExp = std(Xe);

