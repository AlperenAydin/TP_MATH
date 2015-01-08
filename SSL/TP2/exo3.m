clear all;close all; hold on;

A = 10 ; phi_0 = 90;

ve = 100;
v1 = 10; v2= 11; 
T = 2;

N =1000;

[k1,s1,M1] = signal_test(A,phi_0,T,ve,v1);
[k2,s2,M2] = signal_test(A,phi_0,T,ve,v2);

s = s1+s2;
k=k1;M= M1;


subplot(3,2,1);
str  = sprintf('Signal 1: \n Signal de frequence v_0 = %d Hz: ',v1);
plot (k1/ve, s1);
title(str);
xlabel('t=kT_e');
ylabel('s_1(t)');

subplot(3,2,2);
str  = sprintf('Signal 2: \n Signal de frequence v_0 = %d Hz: ',v2);
plot (k2/ve, s2);
title(str);
xlabel('t=kT_e');
ylabel('s_2(t)');

subplot(3,2,[3,4]);
str  = sprintf('La somme des deux signaux: ');
plot (k/ve, s);
title(str);
xlabel('t=kT_e');
ylabel('s(t)');

S = fft(s,N);
frequence =linspace (1,ve,N);

subplot(3,2,5);
plot(frequence,abs(S));
title('Le module du spectre du signal observee sur un duree de 2s');
xlabel ('v (Hz)')


S = fft(s(1:M/4),N);

subplot(3,2,6);
plot(frequence, abs(S));
title('Le module du spectre du signal observee sur un duree de 0.5s');
xlabel ('v (Hz)')




