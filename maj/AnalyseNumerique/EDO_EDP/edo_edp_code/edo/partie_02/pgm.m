clear;
clf;

%% Champ de vecteur
%Nombre d echantillons
N = 20;

%Vecteur unidimentionnelles suivant x et y
ux = linspace(-1,1,N);
uy = linspace(-1,1,N);

%Tableaux 2D de coordonnées (x,y)
[x,y] = meshgrid(ux,uy);

%Calcul de (fx,fy) pour toutes les valeurs de (x,y)
[fx,fy] = f1(x,y);

n = sqrt( fx.^2 + fy.^2 );

fx = fx./n; fy = fy./n;

%Affichage de fx et fy sous forme de champ de vecteurs
quiver(x,y,fx,fy);

%% Euler
%Pas d’integration temporel
dt = 0.1;
%"Pointeur" de fonction sur f1
F=@f1;
%Conditions initiales
x0 = 1; y0 = 2;
%Appel de l’integration numérique
[x,y] = euler(x0,y0,F,dt)