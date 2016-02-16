function A = aireBase(M, R)
%% Algorithme
% Pour chaque paire de point,
% On calcule le vecteur unitaire
% Utilisant ce vecteur


I = zeros(1000);
l=length(M);
disk = strel('disk', R, 4);
figure();
for i=1:l-1
    P1 = M(:,i);
    P2 = M(:,i+1);
    u = (P2-P1) / norm(P2-P1);
    P = P1;
    for j = 1:round(norm(P2-P1))
        I(round(P(1)),round(P(2))) = 1;
        P = P+u;
    end
end
I = imdilate(I,disk);
A = sum(sum(I));
end