close all; clear all;

% lecture d’un fichier image
I=imread('pic_1.png');

% conversion de valeurs en double
I2=double(I);

%affichage d’une image avec normalisation du niveau de gris
imagesc(I);

%modification de la table de couleur en noir et blanc
colormap gray;

%efface l’image preexistante
clf;

%affiche une image
imagesc(I);

%genere une courbe
N = 100; R = 180;
Cx = 250; Cy = 225;
t=[0:N-1]/N;t=t';
vx=R*cos(2*pi*t)+Cx;
vy=R*sin(2*pi*t)+Cy;

%permet l’affichage en sur-impression
hold on;

%affiche le cercle en rouge
plot([vx;vx(1)],[vy;vy(1)],'r');



