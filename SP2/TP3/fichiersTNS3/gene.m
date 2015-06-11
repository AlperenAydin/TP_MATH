function [s,t,OK]=gene(numsig,M,nue)
% function [s,t,OK]=gene(numsig,M,nue);
% 
% G�n�re M points du signal portant le numero numsig
% de bande maximale 10 kHz constitu� de 5 composantes
% Il sera �chantillonn� � la fr�quence nue
%
% variables d'entr�e
%       numsig : num�ro du signal affect� par l'intervenant en d�but de
%                s�ance
%		M :	nombre d'�chantillons du signal
%				peut prendre les valeurs 125 250 500 1000 2000 4000
%		nue :	fr�quence d'�chantillonnage
%				doit �tre un multiple de 2000 compris entre 2000 et 20000 Hz
% 
% variables de sortie
%		s :	s�quence des M �chantillons du signal
%		t :	s�quence telle que t=k*Te, k=0,...,M-1
%       OK = 1 si la g�n�ration s'est bien d�roul�e

% test de la fr�quence d'�chantillonnage
tnue=nue/2000;
if (tnue~=fix(tnue))|(nue<2000) |(nue>20000)
   disp('Le syst�me d''acquisition ne fonctionne pas')
   disp('avec cette fr�quence d''�chantillonnage')
   if nue<2000
      disp([num2str(nue),' Hz est une fr�quence trop faible'])
   end
   if nue>20000
      disp([num2str(nue),' Hz est une fr�quence trop �lev�e'])
   end
   if (tnue~=fix(tnue))
      disp('La fr�quence doit �tre un multiple de 2000 Hz')
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
      % r�cup�ration de tout le fichier
      eval(['load sig',num2str(numsig)]);
      % �laboration du vecteur temps
      t=(0:M-1)/nue;
      Mvar=[125 250 500 1000 2000 4000];
      colonne=find(Mvar==M);
      ligne=nue/2000;
      indice=0;
      % il y a 10 s�quences possibles pour 10 nue possibles
      if colonne~=1
         indice=10*sum(Mvar(1:colonne-1));
      end;
      indice=indice+(ligne-1)*Mvar(colonne)+1;
      s=x(indice:indice+M-1);
      clear x
      disp(['La dur�e de signal g�n�r� est de ',num2str(t(M)),' secondes']);
      OK=1;
   end
end


