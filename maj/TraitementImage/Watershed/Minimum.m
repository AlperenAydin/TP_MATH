function [mini, Minima]=Minimum(I,s)

ind=find(I==0);
I(ind)=max(I(:))*1.1;
%Minima = imregionalmin(I);
Minima = imextendedmin(I,s);

figure(3),imagesc(Minima);

mini=find(Minima);



%Exercice pour comprendre imextrendemin
% tmp=ones(20,20)*10;
% 
% tmp(10,10:12)=[3 3 3];
% tmp(11,9:13)=[5 2 2 2 3];
% tmp(12,9:14)=[5 1 1 1 2 3];
% tmp(13,9:14)=[5 2 2 2 3 3];
% 
% tmp(15,15:16)=[4 4];
% tmp(16,15:17)=[2 1 4];
% tmp(17,14:17)=[2 1 2 4];
% tmp(18,15)=2;
% 
% Minima = imextendedmin(tmp,2);
% figure(1),imagesc(tmp)
% figure(2),imagesc(Minima);