clear all;close all; hold on;

A = 10 ; phi_0 = 90;
T = 0.6;
v0 = 30; ve = 1000;

[k,s,M] = signal_test (A,phi_0,T,ve,v0);

str = sprintf('A = %d, phi_0 = %d, T = %d, v_e =%d, v_0= %d ',A,phi_0,T,ve,v0);

figure (1);
subplot(2,1,1);
stem   ((k/ve),s);
title ([str, 'avec la fonction stem']);
xlabel ('t = kT_e');
ylabel ('s(t)');

subplot (2,1,2);
plot    ((k/ve),s);

title ([str, 'avec la fonction plot']);
xlabel ('t = kT_e');
ylabel ('s(t)');

N =4*M;
show_fft(s,N,ve,2);