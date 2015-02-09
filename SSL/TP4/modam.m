function [modulan,num]=modam(chsig,nue);
% génération du modulant
% dans le cas de la modulation d'amplitude
%
nue=8000;
M=2048;%chgt MC au lieu de 1024
num=0;
modulan=zeros(1,M);
%	N GACHE le 18/1/96
	   if chsig==1
		num=input('frequence du signal modulant ? : ');
	      	modulan=cos(2*pi*num*(0:M-1)/nue);
           end;
  	   if chsig==2

		load toto
		modulan=toto;
	
	   end;
	   