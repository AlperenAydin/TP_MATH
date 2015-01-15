clear all; close all; 


M  = 700;
Fe = 48000;
t1 = [-M/2/Fe:1/Fe:(M/2-1)/Fe]; l =length(t1);
dirac = zeros(1,l);
dirac(l/2) =1;

% e: signal d'entree 
% s: signal de sortie
% h: reponse impulsionelle
% s(t) = e(t)*h(u)
% si e est un dirac, s(t) = h(t).
reponse_impulsionelle = filtel(dirac,50000);

figure(3);
subplot(2,2,1);
plot(t1,dirac);
title('Le signal d entree :Un pic de Dirac');
xlabel('t(s)');


m  = length(reponse_impulsionelle);
t2 = -m/2/Fe:1/Fe:(m/2-1)/Fe;
subplot(2,2,2);
plot(t2,reponse_impulsionelle);
title('Reponse impulsionelle');
xlabel('t (s)');


subplot (2,2,3);
gain_complexe = fft(reponse_impulsionelle,2*m); %TF(h(t)) = H(v)
N = length(gain_complexe);
F = 0:Fe/N:Fe-(Fe/N);
plot(F(1:N/2),abs(gain_complexe(1:N/2)));% module de gain complexe
hold on;
title ('Les termes positives de module de la gain complexe');
xlabel('v_e (Hz)');

mx_freq = max (gain_complexe(1:N/2));
bp_freq = mx_freq / (2^0.5);

bande_passante    = find (gain_complexe(1:N/2) >=  bd_freq);

% La frequence de coupure est la plus grande frequence dans la bande passante
frequence_coupure = F(length(bande_passante));
plot(bande_passante*bp_freq);

subplot (2,2,4);
plot(F(1:N/2),unwrap(angle(gain_complexe(1:N/2))));%phase de gain complexe
title('Le phase du gain complexe');
xlabel('v_e (Hz)');

