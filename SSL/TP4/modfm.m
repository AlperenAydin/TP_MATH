function [modulan,num]=modfm(chsig);
% génération du modulant
% dans le cas de la modulation de frequence
%

%	N GACHE le 18/1/96
M=2048;	   
if chsig==1
    temps=(0:(M-1))/8000;
	      	num=input('frequence du signal modulant ? : ');
	      	modulan=sin(2*pi*num*temps);
           end;
  	   if chsig==2
		
		load toto
		modulan=toto;
	
	   end;
	   %size(modulan)