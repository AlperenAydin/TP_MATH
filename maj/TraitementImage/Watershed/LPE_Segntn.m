%Segmentation par ligne de partage des eaux
%Octobre 2012
%Utilisation de FAH

close all
clear all
clc
pause on;


tic
CQueue

num=3; %correspond � diff�rentes images
switch num
    case 1
        I0=[ 8  5  5  6  5  7 % définition d'une image à la main
            6  3  3  5  4  5
            4  1  1  3  5  8
            8  4  3  4  6  4
            9 10 10  6  3  3
            9 10 10  5  4  4
          ];
        mini=[9, 15, 26, 29, 35]; %position des minima dans la matrice image
        plateau=false; %pas de fond trait� comme marqueur : toute l'image est partionn�e
        I=I0; %On travaille ici avec la matrice d'origine
        
    case 2
        I0=imread('Image2.gif');
        
        I=Distance(I0,0); %se sera l'image sur laquelle est effectu�e la LPE
        [mini, Minima]=Minimum(I,0.015); %recherche des minima �tendus
        
        I=im2uint8(I) + 1; %un indice de la FAH=un ng => on passe en entier non sign�
        plateau=true; %Le fond n'est pas trait�=un marqueur
    case 3
        I0=rgb2gray(imread('Image3.jpg'));
        level = graythresh(I0);
        I0 = im2bw(I0, level);
        I=Distance(I0,0); %se sera l'image sur laquelle est effectu�e la LPE
        [mini, Minima]=Minimum(I,0.0031); %recherche des minima �tendu
        I=im2uint8(I) + 1; %un indice de la FAH=un ng => on passe en entier non sign�
        plateau=true; %Le fond n'est pas trait�=un marqueur
end

figure(1),imagesc(I0),colormap gray, title('I0');
disp('figure 1 : image de travail');

[H W]=size(I);
figure(2), imagesc(I),colormap gray, title('I');
disp('figure 2 : carte des distances');
        
%Carte des minima = les marqueurs
disp('Étape des minima...');
L=zeros(H,W);
L(mini)=1;
[L n]=bwlabel(L); % renvoie une matrice contenant les objets connectés. Ils sont référencés par un numéro dont le nombre est n

%Ajout des pixels du fond aux marqueurs
disp('Étape de l ajout des pixels de fond...');
if plateau %mis à true pour case 2 et 3, mis à false pour case 1
    ind=find(I==1); %contient les indices des cases qui valent 1
    n=n+1;
    L(ind)=n; %les pixels du fond (I==1) ont maintenant une valeur qui leur est propre
end
figure(3),imagesc(L);
disp('figure 3 : insertion des marqueurs');

%Cr�ation du "tableau de queues" i.e. FAH
disp('Étape de la création du tableau de queue...');
ng=I(:);
ng=unique(ng); %on vire les doublons
for i=1:length(ng)
    disp([num2str(i/length(ng)*100), '%']); %petit pourcentage pour voir où on en est dans l'exécution qui se traîne
    FAH(ng(i))=CQueue();
end

%Empilement des pixels marqués dans les piles
disp('Étape de l empilement des marqueurs...');
for ind = 1:H*W
    if (mod(ind,2*W) == 0) %poucentage pour voir l'avancement
        disp(['Empilement des marqueurs : ',num2str(ind/(H*W)*100), ' %']);
    end
    
    if(L(ind) ~= 0)
        pile = FAH(I(ind));
        pile.push(ind);
    end
end
disp(['Empilement des marqueurs : ',int2str(ind/(H*W)*100), ' %']);

l = min(I(mini));

save = 0;
while (l < length(FAH))
    jeton_crt = FAH(l).pop();
    pxs = Voisinage4(jeton_crt, H, W);
    for ind = pxs
        if (L(ind) == 0)
            L(ind) = L(jeton_crt);
            ng = I(ind);
            if(ng >= l)
                FAH(ng).push(ind);
            else
                FAH(l).push(ind);
            end
        end
    end
    
    while(FAH(l).isempty())
        l = l+1;
        disp(['Séparation des objets : ',int2str(double(l)/double(length(FAH))*100), ' %']);
    end

end

figure(4);
imagesc(L);
disp('figure 4 : objets séparés');

t=toc;
fprintf('\nRunning time %f s',t);





