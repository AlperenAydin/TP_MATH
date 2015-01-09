clear all; close all; 

a = 'aaa.wav'; ch = 'chhhhh.wav';

[y_aaa, spectre_a,Fe_a]=analyse(a,100000);
[y_ch,spectre_ch,Fe_ch]=analyse(ch,100000);

Fc= 600;N = 8192 ;

filtre_aaa=PB(y_aaa, Fe_a,Fc);
filtre_ch =PB(y_ch,Fe_ch, Fc);

spectre_filtre_aaa = fft(filtre_aaa);
spectre_filtre_ch  = fft(filtre_ch);

figure(1);

subplot(2,2,1);
plot(y_aaa);

subplot(2,2,2);
plot(abs(spectre_a(1:N/2)));


subplot(2,2,3);
plot(filtre_aaa);


l = length(spectre_filtre_aaa);
subplot(2,2,4);
plot(abs(spectre_filtre_aaa(1:l/2)));


figure(2);

subplot(2,2,1);
plot(y_ch);

subplot(2,2,2);
plot(abs(spectre_ch(1:N/2)));


subplot(2,2,3);
plot(filtre_ch);


l = length(spectre_filtre_ch);
subplot(2,2,4);
plot(abs(spectre_filtre_ch(1:l/2)));



