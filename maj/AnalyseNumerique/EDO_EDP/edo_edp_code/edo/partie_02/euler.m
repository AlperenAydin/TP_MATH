function [x_out,y_out] = euler(x_in,y_in,F,dt)
%
% x_in: Paramètre x d’entrée
% y_in: Paramètre y d’entrée
% F : Fonction correspondant au système différentiel
% dt : Pas d’intégration temporel
%
[fx, fy] = F(x_in, y_in);
x_out = x_in + dt*fx;
y_out = y_in + dt*fy;