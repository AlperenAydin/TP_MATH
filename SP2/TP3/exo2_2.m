clear all; close all;

%% Creations de signaux
X = 5;
M = 2000;
nue = 20*10^3;

v1 = 3325;
v2 = 6180;

[s,t,OK]=gene(X,M,nue);
sb = s + 8*sin(2*pi*v1*t) +8*sin(2*pi*v2*t);

%% Creations du filtre

%% zeros
nue = 20*10^3;
f_0 = [3325,6180] ./nue;


z = exp(2*pi*i*f_0);
z = [z,(conj(z)),-1];

%% Polynome de fonction de transfert

P =poly(z);
G = real(1/polyval(P,1));
P = P*G;

%% Filtrage

sf = filter(P,1,sb);


%% Affichage des signales

figure(1);

subplot(3,1,1);
plot(t,s);
title('Signal original');
xlabel('t(s)');
ylabel('sb(t)');

subplot(3,1,2);
plot(t,sb);
title('Signal brouillé');
xlabel('t(s)');
ylabel('sb(t)');

subplot(3,1,3);
plot(t,sf);
title('Signal filtré');
xlabel('t(s)');
ylabel('sf(t)')

%% Affichage des densite spectrales
N = 4000;
figure(2);

S = fft(s,N);
subplot(3,1,1);
nu = linspace(0,(nue/2),N/2);
plot(nu,abs(S(1:(N/2)).^2)); grid on;
title('Spectre du signal original');
xlabel('v(Hz)');
ylabel('S')


SB = fft(sb,N);
subplot(3,1,2);
nu = linspace(0,(nue/2),N/2);
plot(nu,abs(SB(1:(N/2)).^2)); grid on;
title('Spectre du signal brouillé');
xlabel('v(Hz)');
ylabel('S')


SF = fft(sf,N);
subplot(3,1,3);
plot(nu,abs(SF(1:(N/2)).^2)); grid on;
title('Spectre du signal filtré');
xlabel('v(Hz)');
ylabel('S')










