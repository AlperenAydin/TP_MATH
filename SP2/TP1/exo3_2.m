clear all; close all; hold on;

A1 = 8; A2 = 5;
v1 = 271; v2 = 1147;
phs1 = 25; phs2 = 38;
td = 0; tf = 18.41*(10^(-3));
ve = 5000;

[t,x,M] = sequence2(A1,A2,v1,v2,phs1,phs2,td,tf,ve);

figure(1);
subplot(2,3,1:3);
stem(t,x);grid on;
axis([ td tf -A1-A2 A1+A2]);
title('Notre signal:')
xlabel('t');
ylabel('x');

N = 2000;
X2 = fft(x,N);

subplot(2,3,4);grid on;
plot(abs(X2));
title('Le module de la TFD de x gradue en indice:');
xlabel('k');
ylabel('X2');

subplot(2,3,5); grid on;
f = linspace(0,1,N);
plot(f,abs(X2));
title('Le module de la TFD de x gradue en frequence reduite:');
xlabel('f');
ylabel('X2');

subplot(2,3,6);grid on;
v= linspace(0,ve/1000,N);
plot(v,abs(X2));
title('Le module de la TFD de x gradue en Hz');
xlabel('v(kHz)');
ylabel('X2');
