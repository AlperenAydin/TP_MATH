clear all; close all; 

[x,Fe] = audioread('phrase.wav');
z = filtel(x,Fe);       % Signal filtré

t = [0:1/Fe:10-1/Fe];

figure(1);
subplot (2,1,1);
plot(t,x);

subplot (2,1,2);
plot(t,z);

spectre = fft(x);
spectre_filtre = fft(z);

l=length(spectre);

figure(2);
subplot (2,1,1);
plot(abs(spectre(1:l/2)));

subplot (2,1,2);
plot(abs(spectre_filtre(1:l/2)));
