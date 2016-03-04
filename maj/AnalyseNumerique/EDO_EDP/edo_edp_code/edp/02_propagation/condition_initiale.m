function f0 = condition_initiale(x)
% 
% x : vecteur d'échantillons
%



sigma = 0.1;
f0 = 0.3*exp(-((x-0.5)/sigma).^2)';

