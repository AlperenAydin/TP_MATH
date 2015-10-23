function [p, X] = calcul_dhistogr( x, M )

N= length(x);   
mx = mean(x);
sigx = std(x);

if ~exist('M')
    dx = 3.49*sigx*(N^(-1/3));
    M = (max(x)-min(x))/dx;
    [H,X] = hist(x, M);
    titre = sprintf('La densite de probabilite estimee \n  avec M = %d avec dx optimal', M);
elseif exist('M')
    dx = (max(x)-min(x))/M;
    [H,X] = hist(x, M);
    titre = sprintf('La densite de probabilite estimee \n avec M = %d ',M);
    
end

%% Calcul de l'estimation de la densite de probabilite (empirique)
% p = Nbr d'ech dans [x-dx/2;x+dx/2] / N*dx

p = H/(N*dx);

%% Affichage
hold on; grid on;
stem(X, p);
title(titre);
xlabel('x');
ylabel('p_x')

