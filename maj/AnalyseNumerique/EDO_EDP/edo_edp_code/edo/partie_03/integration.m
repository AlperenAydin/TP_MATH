function [trajectory_x,trajectory_y] = integration(x0,y0,F,integrator,dt,N_step)
%
% x0 : position initiale en x
% y0 : position initiale en y
% F : Fonction a integrer
% integrator : Méthode d’integration
% dt : Pas d’integration temporel
% N_step : Nombre d’étapes d’integrations
%
% trajectory_x : Ensemble des N_step positions en x suivant l’integration
% trajectory_y : Ensemble des N_step positions en y suivant l’integration
%
trajectory_x =zeros(1,N_step);
trajectory_y =zeros(1,N_step);
x = x0;
y = y0;

for i = 1:N_step
    trajectory_x(i) = x;
    trajectory_y(i) = y;
    [x,y] = integrator(x,y,F,dt);

end