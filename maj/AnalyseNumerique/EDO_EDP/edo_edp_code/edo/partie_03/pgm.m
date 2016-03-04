clear;
clf;
close all;

figure();
%Nombre d echantillons
N = 20;

%"Pointeur" de fonction sur f1
F=@f2;
m = 15;
%vecteur unidimentionnelles suivant x et y
ux = linspace(0,m,N);
uy = linspace(0,m,N);

%tableaux 2D de coordonnées (x,y)
[x,y] = meshgrid(ux,uy);

%calcul de (fx,fy) pour toutes les valeurs de (x,y)
[fx,fy] = F(x,y);

%Normalisation
n = (fx.^2+fy.^2).^0.5;
fx = fx./n;
fy = fy./n;

%Affichage de fx et fy sous forme de champ de vecteurs
quiver(x,y,fx,fy);


%Pas d'integration temporel
dt = 0.1;


%Conditions initiales
x0 = 2; y0 = 2;

%"Pointeur" de méthode d'intégration
integrator_euler = @euler;
integrator_rk2 = @rk2; 

%Nombres d'étapes
N_step = 100;

%Calcul des trajectoires
[traj_x_euler,traj_y_euler] = integration(x0,y0,F,integrator_euler,dt,N_step);
[traj_x_rk2,traj_y_rk2] = integration(x0,y0,F,integrator_rk2,dt,N_step);


%Affichage du résultat
hold on
plot(traj_x_euler,traj_y_euler,'r','LineWidth',3);
plot(traj_x_rk2,traj_y_rk2,'b','LineWidth',3);
plot(x0,y0,'.k');

figure();
hold on;
d = sqrt( traj_x_rk2.^2 + traj_y_rk2.^2);
plot(d);


