close all; clear all; clc;

f = @(x)(cos(pi*x/2));

r_correct = 4/pi;

n = 3:6;
r = zeros(size(n));

for i = 1:length(n)
    X = LegendreRoots(n(i) );
    W = Poids(X,n(i));
    r(i) = Quadrature(f,X,W);
end

subplot(2,1,1);
plot(n,r, n, r_correct*ones(size(r)));  

subplot(2,1,2);
erreur = r - r_correct;
plot(n,erreur);