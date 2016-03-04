function f_out = evolve(f_in,dx,dt)
%
% f_in  : Valeurs de la fonction a l'instant courant
% dx    : Pas d'intégration spatial
% dt    : Pas d'intégration temporel
% f_out : Valeurs de la fonction a l'instant suivant
%
l = length(f_in);
r = dt/(dx^2);
 
%% Version Explicite
f_out = (1-2*r)*f_in;
f_out(1:l-1) = f_out(1:l-1)+ r*f_in(2:l);
f_out(2:l) = f_out(2:l) + r*f_in(1:l-1);

