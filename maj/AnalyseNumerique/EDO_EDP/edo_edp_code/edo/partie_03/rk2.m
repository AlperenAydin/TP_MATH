function [x_out,y_out] = rk2(x_in,y_in,F,dt)
%
% x_in: Paramètre x d’entrée
% y_in: Paramètre y d’entrée
% F : Fonction correspondant au système différentiel
% dt : Pas d’intégration temporel
%

[fx05, fy05] = F(x_in, y_in);
x05 = x_in +dt*0.5*fx05;
y05 = y_in +dt*0.5*fy05;
[fx, fy] = F(x05, y05);
x_out = x_in + dt*fx;
y_out  = y_in + dt*fy; 