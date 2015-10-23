clear all; close all; 
Fs = 1*10^3; Ts = 1/Fs;
N= 1000; B= 100; Bs = B/Fs;

m3 = 7; sig3 = 3;
[ x1, x2, x3, a, b ] = syntheseSA(N, Bs, m3, sig3);
M = 20;
%% Les series temporelles et les densite de probabilite 
% signaux genere par syntheseSA

figure(1);

subplot(2,3,1); hold on;
plot([1:N]*Ts,x1); 
titre1 = sprintf('x_1 \n Un bruit gaussien centre,ecart-type 1');
title(titre1);
xlabel('t (s)');
ylabel('x1');


subplot(2,3,4);

[p1, X1] = calcul_dhistogr( x1); hold on;
p_th1 = (1/sqrt(2*pi)) *exp (-(X1.^2)/2);
plot(X1,p_th1);


subplot(2,3,2); hold on;
plot([1:N]*Ts,x2); 
titre2 = sprintf('x_2 \n Le signal filtre passe-bas (fc = %d) de x1',B);
title(titre2);
xlabel('t (s)');
ylabel('x2');


subplot(2,3,5);
[p2, X2] = calcul_dhistogr( x2);
sig2 = sqrt(2*B/Fs);
p_th2 = (1/(sig2*sqrt(2*pi)))*exp(-(X2.^2)/(2*(sig2^2)));
plot(X2,p_th2);

subplot(2,3,3); hold on;
plot([1:N]*Ts,x3); 
titre3 = sprintf('x_3 \n La transformation de x2 \n pour un moyenne de %d, et un ecart-type de %d',m3,sig3);
title(titre3);
xlabel('t (s)');
ylabel('x3');


subplot(2,3,6);
[p3, X3] = calcul_dhistogr( x3);
p_th3 = (1/(sqrt(2*pi)*sig3))*exp(-(( X3- m3).^2)/(2*(sig3^2)));
plot(X3, p_th3);

%% Gain complexe du filtre

figure(2);
[H,f] = freqz(b, a, 100, Fs);
plot(f,abs(H));
titre = sprintf('Filtre basse-bas de Butterworth d ordre 8 \n de frequence de coupure de fc=%d Hz',B)
title(titre);
xlabel('f (Hz)');
ylabel('|H|');