close all; clear all; clc;
grid on; hold on;

%% Generation du motif
l = 10;
M = 1+8*rand(2,l);
plot(M(1,:), M(2,:));
% On calcule L pour test
L = longueurCourbe(M);
% L'aire de la base
A = aireBase(100*M, 100);
A = A/10000;

%% Test
% On genere N cercles de rayon 1 de centre C(a,b)
% Pour chacun, on 'visite' le ligne brisée 

N = 5000;
s = 0;
for i = 1:N
    a = 1+8*rand;
    b = 1+8*rand;
    % On calcule le nombre d'intersections de cercle de rayon 1 centre (a,b)
    % Pour chaque paire de points dans M, on cherche l'intersection
    n=0;
    for j=1:l-1
        n = n + intersection(M(:,j),M(:,j+1), a, b);
    end
    s = s + n;
end

m = s/N;
Lthe = m*A/4;



