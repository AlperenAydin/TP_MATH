clear all; close all;
nue = 16*10^3;
db= 70;
[s5,Fs] = audioread('signal5.wav');

sgram(s5,nue,db,1);

%% Le premier filtre avec un fenetre rectangulaire
fc = 2.75*10^3/(nue/2);
M = 175;

fil1 = fir1(M-1,fc,rectwin(M));
sf1 = filter(fil1,1,s5);

%% Affichage de signal filtre et analyse du filtre
sgram(sf1,nue,db,2);
affiche_filtre(fil1,nue,3);

%% Le deuxieme filtre  avec un fenetre de Blackman

fil2 = fir1(M-1,fc,hann(M));
sf2 = filter(fil2,1,s5);

%% Affichage de signal filtre et analyse du filtre
sgram(sf2,nue,db,4);
affiche_filtre(fil2,nue,5);

soundsc(sf2,Fs);

figure(6);
N =2^10;

subplot(2,2,1);
rect = fir1(M-1,fc,rectwin(M));
[H,F] = freqz(rect,1,N,nue);
plot(F,abs(H));
title(['Fenetre rectangulaire avec fc=', num2str(fc*(nue/2))]);
xlabel('Frequence (Hz)');

subplot(2,2,2);
hamming = fir1(M-1,fc,hamming(M));
[H,F] = freqz(hamming,1,N,nue);
plot(F,abs(H));
title(['Fenetre hamming avec fc=', num2str(fc*(nue/2))]);
xlabel('Frequence (Hz)');

subplot(2,2,3);
hann = fir1(M-1,fc,hann(M));
[H,F] = freqz(hann,1,N,nue);
plot(F,abs(H));
title(['Fenetre hanning avec fc=', num2str(fc*(nue/2))]);
xlabel('Frequence (Hz)');

subplot(2,2,4);
blackman = fir1(M-1,fc,blackman(M));
[H,F] = freqz(blackman,1,N,nue);
plot(F,abs(H));
title(['Fenetre blackman avec fc=', num2str(fc*(nue/2))]);
xlabel('Frequence (Hz)');
