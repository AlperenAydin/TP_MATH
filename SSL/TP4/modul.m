% program modul
%
% étude des modulations d'amplitude et de fréquence
% 
% modulation d'amplitude - à porteuse supprimée
%                        - avec porteuse
%                        - BLU sans porteuse
% 	deux signaux s1 cosinus et s2
%    		fréquence de s1 à choisir
%		taux de modulation à choisir
%
% modulation de fréquence
% 	un signal s1 cosinus de fréquence à choisir
% 		indice de modulation à choisir
%
% les signaux sont échantillonnés à 8000 Hz
% la porteuse est toujours à 2000 Hz

chtyp=1;
while chtyp<3
   chtyp=menu('Type de modulation','d''amplitude','de frequence','FIN');
   if chtyp==1
	cham=menu('Modulation d''amplitude','sans porteuse','avec porteuse',...
			'a bande laterale unique');
	t=(0:2047)/8000;%chgt MC au lieu de 1024
	chsig=menu('choix du modulant','s1 : cosinus','s2');
	if cham==1
		disp('MODULATION SANS PORTEUSE');
  		[modulan,num]=modam(chsig);
        sizemodulan=size(modulan);
        x=cos(2*pi*2000*t);
        sizex=size(x);
		signal=modulan.*x;
		if chsig==1
			titre=['modulation AM sans porteuse, modulant s1 a ',...
			num2str(num),' Hz'];
		elseif chsig==2
			titre='modulation AM sans porteuse, modulant s2';
		end;
        end;
   if cham==2
		disp('MODULATION AVEC PORTEUSE');
		[modulan,num]=modam(chsig);
		m=input('taux de modulation m ? ');
     		signal=(1+m*modulan).*cos(2*pi*2000*t);
		if chsig==1
			titre=['modulation AM avec porteuse, modulant s1 a ',...
			num2str(num),' Hz, m= ',num2str(m)];
		elseif chsig==2
			titre=['modulation AM avec porteuse, modulant s2, m= ',num2str(m)];
		end;
        end;
	if cham==3
		disp('MODULATION A BANDE LATERALE UNIQUE');
      		[modulan,num]=modam(chsig);
		signal=(modulan.*cos(2*pi*2000*t))-...
			(imag(hilbert(modulan)).*sin(2*pi*2000*t));
		if chsig==1
			titre=['modulation AM BLU, modulant s1 a ',...
			num2str(num),' Hz'];
		elseif chsig==2
			titre=['modulation AM BLU, modulant s2, m= ',num2str(m)];
		end;
        end;
   end; %chtyp=1
   if chtyp==2
	disp('MODULATION DE FREQUENCE');
    t=(0:2047)/8000;
	[modulan,num]=modfm(1);
	mu=input('indice de modulation mu ? ');
	%echo off
	signal=cos((2*pi*2000*t)+(mu*modulan));
	titre=['modulation FM, modulant a ',...
				num2str(num),' Hz, mu= ',num2str(mu)];
   end; % chtyp==2
   if chtyp<3
	figure(1)
	clf
	subplot(2,1,1),plot(t(1:256),signal(895:1150))
	title(titre),xlabel('secondes')
	set(gca,'XLim',[t(1) t(256)],'YLim',[1.1*min(signal) 1.1*max(signal)])
	z=fft(signal,4096);
	sp=z(1:2048).*conj(z(1:2048))/2048/2048;
	nu=(0:2047)*8000/4096;
	subplot(2,1,2),plot(nu,sp)
	title('densite spectrale du signal resultant')
	xlabel('Hz')
	set(gca,'XLim',[nu(1) nu(2048)],'YLim',[0 1.1*max(sp)])
	
   end; %if chtyp<3
end; %while chtyp<3
clear all



