close all; clear all; clc;

%% Calcul d'integrale par methode de Monte-Carlo
% N valeur dans [0,1] sont pris aleatoirement.
% Nous calculons leur image par la fonction, puis nous prenons leur moyenne 
% Celle-la nous donne une appriximation de l'integrale

% Valeur theorique pour calculer l'erreur
theorique = atan(1)-atan(0);


i=1;
NI = 1e2:10:5e4;
for N=NI
    x = rand(1,N);
    y = 1./(x.^2+1);
    
    % On stocke les extimation dans un tableau pour voir l'effet de N
    I(i) = sum(y)/N;
    i = i+1;
end

subplot(1,2,1); grid on;
plot(NI,I,NI,theorique*ones(size(NI)));
title('Calcul d''integrale par methode de Monte-Carlo');
legend('Methode de Monte Carlo avec N valeur','Valeur theorique ');
xlabel(N);


subplot(1,2,2);grid on;
erreurEst = I-theorique;
plot(erreurEst);
title('Erreur d''estimation');
xlabel('N');