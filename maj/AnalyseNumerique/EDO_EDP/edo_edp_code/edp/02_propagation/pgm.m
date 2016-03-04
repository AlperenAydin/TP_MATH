clear;
clf;


% Pas d'échantillonnage spatial
dx = 0.003;
% Pas d'échantillonnage temporel
dt = 0.002;


% Vecteur des abscisses
x = [0:dx:1];
Nx = length(x);

% Creation des conditions initiales
f0 = condition_initiale(x);
f = f0;
f_prev = f;



% Temps total d'Integration
total_time = 2.0;
% Intervalle de temps entre deux affichages
time_interval = 0.01;

% Integration numerique
t_counter = 0;
f_save=[];
u = [2:Nx-1];
for k_time=[0:dt:total_time]

    f_temp = f;
    f = interation(f, f_prev, dx, dt );
    f_prev = f_temp;

    if( t_counter>time_interval )
        t_counter = 0;
        f_save = [f_save,f];
    else
        t_counter = t_counter+dt;
    end
end



% Affichage

plot(x,f0);

for k=[1:size(f_save,2)]
    plot(x,f_save(:,k),'r');
    axis([0,1,-0.6,1.1]);

    %Sauvegarde des figures dans un fichier
    print(strcat('output/figure_',sprintf('%4.4d',k),'.png'),'-dpng');
end

hold on
for k=[1:size(f_save,2)]
    plot(x,f_save(:,k),'r');
end
axis([0,1,-0.6,1.1])
