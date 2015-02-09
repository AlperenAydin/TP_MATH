clear all; close all; 

a = 'aaa.wav'; ch = 'chhhhh.wav';
N = 100000;

[y_aaa, spectre_a,Fe_a]=analyse(a,N); % On analyse le son 'a',
                                      % on recupere N intervalle
                                      % avec un frequence
                                      % d'echationnage de Fe_a
                                      % et le spectre

[y_ch,spectre_ch,Fe_ch]=analyse(ch,N);% De meme pour ch

Fc= 600;N = 8192 ;

%Le filtrage des signaux
filtre_aaa=PB(y_aaa, Fe_a,Fc);
filtre_ch =PB(y_ch,Fe_ch, Fc);

%Le spectre des ces signaux
spectre_filtre_aaa = fft(filtre_aaa);
spectre_filtre_ch  = fft(filtre_ch);

figure(1);
t = 0:(1/Fe):(N-1)*Fe ;
Ve_a = linspace(0,Fe/2,N/2); % l' absisce pour spectre_a

l = length(spectre_filtre_aaa);
Ve_fa = linspace(0,Fe/2,l/2); % abssice pour spectre_filtre_aaa

subplot(2,2,1);
plot(t,y_aaa);
title('Le signal etudie:');
xlabel('t (s)');

subplot(2,2,2);
plot(Ve_a,abs(spectre_a(1:N/2)));
title('Le spectre du signal etudie:');
xlabel('v_e (Hz)');


subplot(2,2,3);
plot(t,filtre_aaa);
title('Le signal apres le filtrage:');
xlabel('t (s)');


subplot(2,2,4);
plot(Ve_fa,abs(spectre_filtre_aaa(1:l/2)));
title('Le spectre du signal filtre:'):
xlabel('v_e (Hz)');


figure(2);

t = 0:(1/Fe):(N-1)*Fe ;
Ve_ch = linspace(0,Fe/2,N/2); % l' absisce pour spectre_a

l = length(spectre_filtre_aaa);
Ve_fch = linspace(0,Fe/2,l/2); % abssice pour spectre_filtre_aaa

subplot(2,2,1);
plot(t,y_ch);
title('Le signal etudie:');
xlabel('t (s)');

subplot(2,2,2);
plot(Ve_ch,abs(spectre_ch(1:N/2)));
title('Le spectre du signal etudie:');
xlabel('v_e (Hz)');


subplot(2,2,3);
plot(t,filtre_ch);
title('Le signal apres le filtrage:');
xlabel('t (s)');


subplot(2,2,4);
plot(Ve_fch,abs(spectre_filtre_ch(1:l/2)));
title('Le spectre du signal filtre:'):
xlabel('v_e (Hz)');
