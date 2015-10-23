function [ x1, x2, x3, a, b ] = syntheseSA(N, B, m3, sig3)

Fs = 1*10^3;

%% Generation de x1:
% Bruit gaussien centre d'ecart-type 1
x1 = randn(1,N);

%% Butterworth filter:
Ordre = 8;
% Frequence de coupure B
% Wn est la frequence de coupure normalisee
Wn = 2* B/Fs;

[b, a] = butter(Ordre, Wn);

%% Generation de x2:
% Le bruit filtre avec Butterworth de x1

x2 = filter( b, a,x1);

%% Generation de x3:
% Bruit avec valeur moyenne de m3, d'ecart type sig3
% le valeur moyenne de x2 est 0, 
% mais sont ecart-type n'est pas 1
sig2 = sqrt(2*B/Fs);
x3 = (x2/sig2)*sig3 + m3;



end

