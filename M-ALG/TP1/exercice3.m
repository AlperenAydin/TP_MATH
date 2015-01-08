close all;
clear all; 

m = 1;   %correspond a M1 d'enonce
M = 1;
n=3;

for i=1:(n-1);
 m= M;
 M = 1/(2^0.5) .*[m,-m;m,m]
 
end

[V,D] = eig(M);
D
