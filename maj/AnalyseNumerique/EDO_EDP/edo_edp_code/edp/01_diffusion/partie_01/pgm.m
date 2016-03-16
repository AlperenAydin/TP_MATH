clear; close;
clf;

% Pas d'échantillonnage spatial
dx = 0.001;

% Pas d'échantillonnage temporel
dt = 4.0e-5;

% R = c* dt/dx^2
% Pour non divergence, il faut que 0 < r < 0.5
% => 2*dt < dx² 

% Valeurs de x echantillonnées
x = [0:dx:1];
Nx = length(x);

% Condition initiale
f0 = condition_initiale(x);

% Nombre de pas d'integrations
N = 10;

% Integration numerique
f = f0;
for k=[0:N]
    f = evolve(f,dx,dt);
end

% Affichage
plot(x,f0,'b'); %f0 en bleu
hold on
plot(x,f,'r');  %f en rouge
legend('Etat initial', ['Apres ', num2str(N), ' iterations'] );
title(['Diffusion thérmique avec dx = ', num2str(dx), ' et dt = ', ...
       num2str(dt)],'FontSize' );
xlabel('x');
ylabel('y');
