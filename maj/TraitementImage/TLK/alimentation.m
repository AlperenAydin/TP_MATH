close all; clear all; clc;

Pays =['RFA ';'FR  ';'IT  ';'PB  ';'UEBL';'RU  ';'IR  ';'DM  ';'GR  '];

load('tableau.mat');
D = D';
moy = mean(D);
moys = ones(9,1)*moy; 
variance = std(D);
variances = ones(9,1)*variance;

D0 = (D-moys)./variances;

T = D0'*D0;


[VecP,ValP] = eig(T);
%% Nous prenons les vecteur propres le plus grands, car ils sont plus significatif
% On regroupe les pays qui ont le meme habitudes alimentaire
Vx = VecP(:,end); Vy = VecP(:,end-1);
X = D0*Vx; Y = D0*Vy;

scatter(X,Y,'or','fill');
text(X,Y,Pays);