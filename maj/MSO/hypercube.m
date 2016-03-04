clear all; close all; hold on; axis equal;

%% Calcul de la base;
B = orth(rand(4,3));

%% La form et sa construction
C = [0 0 0 0 1 1 1 1;
    0 0 1 1 0 0 1 1;
    0 1 0 1 0 1 0 1
    0 0 0 0 0 0 0 0];


T = 2*rand(4,1)*ones(1,8);
C = [C, C+T];
l = length(C);
dim = log(l)/log(2);


V = matriceContengance(dim);

for K = 1:length(C)
    for L=1:length(C)
       if V(K,L)
           A = [K,L];
           X = C(:,A)'*B(:,1);
           Y = C(:,A)'*B(:,2);
           Z = C(:,A)'*B(:,3);
           %plot3(C(1,A),C(2,A),C(3,A), 'linewidth',3);
           plot3(X,Y,Z, 'linewidth', 3);
       end
    end
end

view(60,30);