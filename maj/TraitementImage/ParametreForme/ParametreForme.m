close all; clear all; clc;
pause on;
%% Generation des directions
% Dir = x,y
% Sens trigonometrique commencant par l'horizontale droite
Dir4 = [ 0, 1; -1,0 ; 0, -1; 1, 0];
Dir8 = [0,1; -1,1 ; -1,0; -1,-1; 0,-1; 1,-1; 1,0; 1,1];
v = 4;
if(v ==4)
    Dir = Dir4;
else
   Dir = Dir8; 
end
%%Creation d'un Ellipse
[X,Y] = meshgrid(1:64, 1:64);
a = 60/2; b = round(45/2);

epsilon = 5e-2;
ind = find( ((X-32)/a).^2 + ((Y-32)/b).^2 <= 1);

%%Creation de l'image
Im = zeros(64);
Im(ind) = 1;
subplot(2,1,1);
imshow(Im); hold on;


ImC = zeros(64);
%% Recherche de point (i,j) le plus a gauche de la forme;le plus en haut

[I,J] = ind2sub(size(Im),ind);
j0 = min(J);
i0 = min(I(find( J == j0)));


%% Code de Freeman
i = i0;
j = j0;
dirs = [];
init = 0;
boucle_inf = 0;
d = 1;

m = length(Dir);
while( init == 0 || i~=i0 || j~=j0 )
    d = mod(d-2,m)+1;
    while( Im(i+Dir(d,1),j+Dir(d,2)) == 0)
        d = mod(d,m)+1;
    end
    dirs = [dirs, d];
    ImC(i,j) = 1; 
    i = i + Dir(d,1);
    j = j + Dir(d,2);
    init = 1;

end

subplot(2,1,2);
imshow(ImC);

PeriApprox = 2*pi*sqrt(0.5*( a^2 + b^2));
erreur = abs(PeriApprox-length(dirs))/PeriApprox;
