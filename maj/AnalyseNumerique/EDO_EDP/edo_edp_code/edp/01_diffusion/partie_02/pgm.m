clear;
clf;
close;

% Pas d'échantillonnage spatial
dx = 0.01;

% Pas d'échantillonnage temporel
dt = 4e-4;

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
f = f0;
t_counter = 0;
f_save = [];
M  = matriceInt(dx, dt, length(f0));
for k=[0:dt:total_time]
    f = M\f;
    if( t_counter>time_interval )
        f_save = [f_save,f];
        t_counter = 0;
    else
        t_counter = t_counter + dt;
    end

end

% Affichage
figure();

plot(x,f0,'k'); %f0 en bleu
hold on
for k=[1:size(f_save,2)]
    plot(x,f_save(:,k));  %f2 en violet
    title(['Diffusion thérmique avec dx = ', num2str(dx), ' et dt = ', ...
       num2str(dt)], 'FontSize', 13);
    xlabel('x');
    ylabel('y');
    legend('Original', 'Iterations');	
end

