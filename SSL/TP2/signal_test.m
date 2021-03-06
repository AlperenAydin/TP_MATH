% Input :
% A     : amplitude 
% phi_0 : phase a l'origine
% T     : duree
% ve    : frequence d'echantionage
% v0    : frequence du signal
%
% Output:
% k     : vecteurs indices
% S     : Le Signal
% M     : Le nombre de valeurs


function [k,s,M] = signal_test (A, phi_0,T,ve,v0) 
    M   = T*ve;
    k   = 0:(M-1);
    
    s   = A * sin(2*pi*v0*(k/ve)+(phi_0*pi/180));

end