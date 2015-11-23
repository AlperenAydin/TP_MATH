clear all; close all;

[s,Fs] = audioread('ProtestMonoBruit.wav');
%%sound(s,Fs);

sv = s(60*Fs:70*Fs);
t = (60*Fs:70*Fs)/Fs;
figure(1);
plot(t,sv);
title('Signal original');
xlabel('t (s)');
ylabel('S');

%% DSP du signal 
figure(2);
pwelch(sv);

%% Autocorrelation: 
K = 200;
[c ,lags] = xcorr(sv, K, 'biased');

figure(3);
plot(lags,c); grid on;
title('La fonction d''autocorrelation');
xlabel('\tau');
ylabel('Autocorrelation');

M = 20;

%% Calcul des coefficients

Acor = c (find( (0<=lags) & (lags <= M) ) ) ;


T = toeplitz(Acor);
N = zeros(M+1,1); 
N(1)= 1;

H = pinv(T) * N;
H = -H ./H(1);
H = H(2:length(H));

figure(4);
plot(H);
title('La matrice H');
xlabel('indice');

%% Prediction linaires avec AR(M)

sc = conv(sv,H,'valid');
sc = [zeros(M,1);sc(1:end-1)];

figure(5);
subplot(211);
plot(t,sv,t,sc);
legend('original','estimé')
title('Lee signaux original et restauré');
xlabel('t (s)');
ylabel('S');
subplot(212)
epsilon = sv - sc;
plot(t,abs(epsilon));
title('L''erreur d''estimation');
xlabel('t (s)');
ylabel('L''erreur');


%% Restauration

ki = find( abs(epsilon) > 0.05);
l = length(ki);
sr = sv; %% r pour restauré
for i = 1:l
    sr(ki(i)) = median( sv(max(i,ki-10):(min(ki+10,length(sv)))));    
end

figure(6);
plot(t,sv,t,sr);
legend('original','restauré')
title('Les signaux original et restauré');
xlabel('t (s)');
ylabel('S');

sound(sr,Fs);