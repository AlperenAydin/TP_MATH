clear all;close all; hold on;

N = 500;
[X,Y] = LancerFleches (N);
Rayon = zeros(1,N);

for i = 1:N
    Rayon(i) = sqrt(X(i)^2 + Y(i)^2); 
end

disque = find(Rayon <= 1); %Le nombre des fleches dans le disque
DisqueX = X(disque);
DisqueY = Y(disque);

A = length (disque);
PA = 4*A / N

% affichage

figure(1);
t = [0:0.01:1];
F = sqrt(1- t.^2);
plot(t,F);
title('Methode de Monte-Carlo:')
xlabel('x');ylabel('y');

scatter(X,Y,'r');
scatter(DisqueX,DisqueY,'g');


figure(2);
area(t,F);
title('Methode de Monte-Carlo:')
xlabel('x');ylabel('y');