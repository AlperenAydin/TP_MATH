clear;
clf;
close;

% Pas d'échantillonnage spatial
dx = 1e-4;

% Pas d'échantillonnage temporel
dt = 5e-4;

% Valeurs de x echantillonnées
x = [0:dx:1];
Nx = length(x);

% Condition initiale
f0 = condition_initiale(x);

% Temps total d'Integration
total_time = 0.015;
% Intervalle de temps entre deux affichages
time_interval = 0.001;


% Integration numerique
f1 = f0;
f2 = f0;
t_counter = 0;
f1_save = [];
f2_save = [];
M  = matriceDiff(dx, dt, length(f0));
for k=[0:dt:total_time]
    f1 = evolve(f1,dx,dt);
    f2 = M\f2;
    if( t_counter>time_interval )
        f1_save = [f1_save,f1];
        f2_save = [f2_save,f2];
        t_counter = 0;
    else
        t_counter = t_counter + dt;
    end

end

% Affichage
plot(x,f0,'k'); %f0 en bleu
hold on
for k=[1:size(f1_save,2)]
    plot(x,f1_save(:,k),'r');  %f1 en rouge
    plot(x,f2_save(:,k),'b');  %f2 en violet
end
%%axis([0,1,0,1])

