clear all; close all;

%% Creation des zeros
nue = 20*10^3;
f_0 = [3325,6180] ./nue;


z = exp(2*pi*i*f_0);
z = [z,(conj(z)),-1];

%% Polynome de fonction de transfert

P =poly(z);
G = real(1/polyval(P,1));
P = P*G;

%% Gain complexe du filtre
N=1024;
[H,F]=freqz(P,1,N,nue);

%% Affichages

%% Diagramme poles zeros
subplot(2,2,1);
zplane(roots(P),[]);
title('Diagramme pole-zero du filtre');

%% Reponse impulsionelle
subplot(2,2,2);
stem(P); grid on;

title('Reponse impulsion');
xlabel('k');
ylabel('h');

%% module de gain complexe

f = linspace(0,N/2,N)*20000/N;

subplot(2,2,3);
plot(f,20*log10(abs(H))); grid on;

title('Le module de gain en complexe en dB');
ylabel('Le gain en dB');
xlabel('f');


%% phase de gain complexe
subplot(2,2,4);
plot(f,unwrap(angle(H))); grid on;

title('La phase de gain en complexe');
ylabel('La phase (rad)');
xlabel('f');

