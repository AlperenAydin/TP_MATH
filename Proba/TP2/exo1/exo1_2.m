clear all;close all; hold on;

t = [0:0.01:1];
F = (1 + t.^2) .^(-1);
figure(1);
plot(t,F);
title('Methode de Monte-Carlo Alternative:')
xlabel('x');ylabel('y');

N = 500;
[X,Y] = LancerFleches(N);
scatter(X,Y);

compteur = 0;
for i = 1 :N
    x = X(i); y =Y(i);
    yj = 1/(1 + x^2);
    if (y <= yj)
        % Ceci est pour les fleches au dessus de la courbe
        PX(i) = x;
        PY(i) = y;
        
        compteur =compteur+1;
    end
end    

PA = compteur/N;

scatter(PX,PY,'g');



figure(2);
area(t,F);
title('Methode de Monte-Carlo Alternative:')
xlabel('x');ylabel('y');