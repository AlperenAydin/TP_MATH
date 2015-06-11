function [s,t,OK]=gene(numsig,M,nue)
% function [s,t,OK]=gene(numsig,M,nue);
% 
% Génère M points du signal portant le numero numsig
% de bande maximale 10 kHz constitué de 5 composantes
% Il sera échantillonné à la fréquence nue
%
% variables d'entrée
%       numsig : numéro du signal affecté par l'intervenant en début de
%                séance
%		M :	nombre d'échantillons du signal
%				peut prendre les valeurs 125 250 500 1000 2000 4000
%		nue :	fréquence d'échantillonnage
%				doit être un multiple de 2000 compris entre 2000 et 20000 Hz
% 
% variables de sortie
%		s :	séquence des M échantillons du signal
%		t :	séquence telle que t=k*Te, k=0,...,M-1
%       OK = 1 si la génération s'est bien déroulée

% test de la fréquence d'échantillonnage
tnue=nue/2000;
if (tnue~=fix(tnue))|(nue<2000) |(nue>20000)
   disp('Le système d''acquisition ne fonctionne pas')
   disp('avec cette fréquence d''échantillonnage')
   if nue<2000
      disp([num2str(nue),' Hz est une fréquence trop faible'])
   end
   if nue>20000
      disp([num2str(nue),' Hz est une fréquence trop élevée'])
   end
   if (tnue~=fix(tnue))
      disp('La fréquence doit être un multiple de 2000 Hz')
   end
   s=[];t=[];
   OK=0;
else 
% test du nombre de points
   Mvalide=[125 250 500 1000 2000 4000];
   k=find(M==Mvalide);
   if isempty(k)==1
      disp(['M = ',num2str(M),' ne fait pas partie des valeurs possibles'])
      s=[];t=[];
      OK=0;
   else
      % récupération de tout le fichier
      eval(['load sig',num2str(numsig)]);
      % élaboration du vecteur temps
      t=(0:M-1)/nue;
      Mvar=[125 250 500 1000 2000 4000];
      colonne=find(Mvar==M);
      ligne=nue/2000;
      indice=0;
      % il y a 10 séquences possibles pour 10 nue possibles
      if colonne~=1
         indice=10*sum(Mvar(1:colonne-1));
      end;
      indice=indice+(ligne-1)*Mvar(colonne)+1;
      s=x(indice:indice+M-1);
      clear x
      disp(['La durée de signal généré est de ',num2str(t(M)),' secondes']);
      OK=1;
   end
end


