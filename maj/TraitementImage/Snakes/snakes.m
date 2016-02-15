close all; clear all; pause on;

% lecture d’un fichier image
I=imread('Heart.png');
imagesc(I);
% level = graythresh(I);
% I = im2bw(I,level);
% %%I = imcomplement(I);
I = I(:,:,1);
imagesc(I);

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
N = 100;
[Cx,Cy] = ginput(1);
[x,y] = ginput(1);
R = norm( [Cx-x;Cy-y]  );
t=[0:N-1]/N;t=t';
vx=R*cos(2*pi*t)+Cx;
vy=R*sin(2*pi*t)+Cy;

%permet l’affichage en sur-impression
hold on;

%affiche le cercle en rouge
plot([vx;vx(1)],[vy;vy(1)],'r');

N = length(vx);
%% Matrice derivee d'ordre 2
D2 = diag(-2*ones(1,N))+diag(ones(1,N-1), 1) + diag(ones(1,N-1),-1);
D2(N,1)= 1; D2(1,N) = 1;

%% MAtrice derivee d'ordre 4
D4 = diag(6*ones(1,N))+diag(-4*ones(1,N-1), 1) + diag(-4*ones(1,N-1),-1);
D4 = D4 + diag(ones(1,N-2), 2) + diag(ones(1,N-2), -2);
D4 = D4 + diag(ones(1,2), N-2) + diag(ones(1,2), 2-N);
D4(N,1)= -4; D4(1,N) = -4;

%% Affichage
% En theorie, on devrait avoir des cosinus et sinus
figure();
subplot(2,2,1);
plot(t,D2*vx);
title('D2*vx');

subplot(2,2,2);
plot(t,D2*vy);
title('D2*vy');

subplot(2,2,3);
plot(t,D4*vx);
title('D4*vx');

subplot(2,2,4);
plot(t,D4*vy);
title('D4*vy');

%% Calcul de A et invA
dt = 0.05;
lamb1 = 10; lamb2 = 10;
A = eye(N) + 2*dt*(-lamb1*D2 + lamb2*D4);
invA = inv(A);

% %% Gradient
% figure();
% subplot(1,2,1);
% imagesc(I2);
% g = fspecial('gaussian',15,9);
% I2 = imfilter(I2,g);
% 
% subplot(1,2,2);
% imagesc(I2);
lamb3 =100;
[GX, GY] = gradient(I2);
G = GX.^2 + GY.^2;

[Kx, Ky] = gradient(G);
Kx = -Kx; Ky = -Ky;


figure();
%% Iteration
epsilon = 0.1;
k= 1;
dist = 1;
VX =[]; VY=[];

%% Note sur les lambdas
% Plus lamb1 et lamb2 sont grand, plus la courbe n'arrive pas a se courber
% Plus lamb3 est grand, plus le gradient joue un role
% 
while dist > epsilon   
    VX = [VX, vx];
    VY = [VY, vy];
    %interpolation lineaire calculant P=K(vx,vy);
    Px=interp2(Kx,vx,vy);
    Py=interp2(Ky,vx,vy);
    
    vx= invA*(vx + dt*lamb3*Px);
    vy= invA*(vy + dt*lamb3*Py);
    l = k-10;
    if( l<1)
        l = 1;
    end
    vx0 = mean( VX(:,(l:k)), 2 );
    vy0 = mean( VY(:,(l:k)), 2 );
    dist = mean (sqrt((vx - vx0).^2  + (vy - vy0).^2 )) ;
    
    clf();
    subplot(2,1,1);
    imagesc(I2);colormap('gray');
    hold on;
    plot([vx;vx(1)],[vy;vy(1)],'r');
    
    subplot(2,1,2); hold on;
    E_interne(k) = sum( lamb1*(diff(vx).^2 + diff(vy).^2));
    E_interne(k) = E_interne(k) + sum(lamb2*((D2*vx).^2 + (D2*vy).^2));
    
    E_externe(k) = sum(lamb3*interp2(G,vx,vy));
    
    plot(1:k,E_interne,1:k,E_externe);
    legend('Energie interne','Energie externe');
    
    
    k = k+1;
    pause(0.01);

end

figure();
imagesc(G);

