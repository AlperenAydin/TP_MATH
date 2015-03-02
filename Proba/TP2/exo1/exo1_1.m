clear all;close all; hold on;

N = 500;
[X,Y] = LancerFleches (N);
Rayon = zeros(1,N);

for i = 1:N
    Rayon(i) = sqrt(X(i)^2 + Y(i)^2); 
end

disque = find(Rayon <= 1); %Le nombre des fleches dans le disque
NonDisque =  find(Rayon > 1);

A = length (disque);
PA = 4*A / N

% affichage

t = [0:0.01:1];
F = sqrt(1- t.^2);
plot(t,F);

DisqueX = X(disque);
DisqueY = Y(disque);

scatter(DisqueX,DisqueY);

NDisqueX = X(NonDisque);
NDisqueY = Y(NonDisque);

scatter(NDisqueX,NDisqueY);


