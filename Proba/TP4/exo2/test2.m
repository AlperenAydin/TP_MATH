clear all; close all; hold on;

figure(1);
mu = 5;
rho = 9;
N = 10000;
[X,Y] = loiNormale(N,mu,rho);
scatter(X,Y);

figure(2); hold on; grid on;

k= 100;
x = linspace(mu-rho,mu+rho,k);
h1 = hist(X,100);

% Une valeur correctif due la comportement de hist.
l = h1(k/2);
h = 1/(l *rho*sqrt(2*pi));

bar(x,h*h1,'-g');

theo = exp(-((x-mu).^2)/2*(rho^2));
theo = theo/(rho*(sqrt(2*pi)));
plot(x,theo,'-b','LineWidth',2);

title('Loi Normale');
legend('Empirique','Theorique');
xlabel('t');
ylabel('La Probabilite');

Esperance = mean(X)
Ecart = std(X)
