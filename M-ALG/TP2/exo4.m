clear all; close all; 

A = imread ('einstein.jpg');    % récupération sous forme matricielle 
A = A (:,:,1);                  % on prends uniquement une matrice

A = double(A);                  % on transforme l'image en "double"
[h,l] = size(A);                

figure(1);
subplot(3,1,1)
imshow(uint8(A));

[U,S,V] =svd(A);                % calcul de la svd
s =diag(S);

subplot(3,1,[2,3]);
plot(s);
title('Valeurs singulères dans lordre décroissant');

k = [5,40,100,200,590];
n=length(k);

figure(2);
Ak =zeros(h,l,n);
tau = zeros(1,n);

subplot(2,n,(1:n));
imshow(uint8(A));


for j= 1:n
    for i =1:k(j)
         Ak(:,:,j) = Ak(:,:,j) + s(i)*U(:,i)*V(:,i)'; % expression Ak qst3
    end
    tau(j) = k(j)*(1+h+l)/(h*l);
    str =sprintf ('k=%d avec tau = %d ',k(j),tau(j));
    subplot(2,n,n+j);
    imshow(uint8(Ak(:,:,j)));
    title(str);
    
end
%Remarque: valeurs singuliers sont negligables ()