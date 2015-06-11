clear all; close all; hold on;

A1 = 8; A2 = 5;
v1 = 271; v2 = 1147;
phs1 = 25; phs2 = 38;
td = 0; tf = 18.41*(10^(-3));
ve = 5000;

[t,x,M] = sequence2(A1,A2,v1,v2,phs1,phs2,td,tf,ve);

figure(1);
subplot(3,2,1:2);
stem(t,x);grid on;
axis([ td tf -A1-A2 A1+A2]);
title('Notre signal:')
xlabel('t(s)');
ylabel('x');

X1 = fft(x,M);
subplot(3,2,3);hold on;
plot(real(X1));grid on;
title('La partie reelle de la TFD de x gradue en indice:');
xlabel('k');
ylabel('X1');

subplot(3,2,4);hold on;
plot(imag(X1));grid on;
title('La partie imaginaire de la TFD de x gradue en indice:');
xlabel('k');
ylabel('X1');

subplot(3,2,5);hold on;
plot(abs(X1));grid on;
title('Le module de la TFD de x gradue en indice:');
xlabel('k');
ylabel('X1');

subplot(3,2,6);hold on;
plot(imag(X1));grid on;
title('L angle de la TFD de x gradue en indice:');
xlabel('k');
ylabel('X1');


figure(2);
f= linspace(0,1,M);

subplot(3,2,1:2);
stem(t,x);grid on;
axis([ td tf -A1-A2 A1+A2]);
title('Notre signal:')
xlabel('t(s)');
ylabel('x');

subplot(3,2,3);hold on;
plot(f,real(X1));grid on;
title('La partie reelle de la TFD de x gradue en frequence reduite:');
xlabel('f');
ylabel('X1');

subplot(3,2,4);hold on;
plot(f,imag(X1));grid on;
title('La partie imaginaire de la TFD de x gradue en frequence reduite:');
xlabel('f');
ylabel('X1');

subplot(3,2,5);hold on;
plot(f,abs(X1));grid on;
title('Le module de la TFD de x gradue en frequence reduite:');
xlabel('f');
ylabel('X1');

subplot(3,2,6);hold on;
plot(f,imag(X1));grid on;
title('L angle de la TFD de x gradue en freqence reduite:');
xlabel('f');
ylabel('X1');


figure(3);
v= linspace(0,ve/1000,M);

subplot(3,2,1:2);
stem(t,x);grid on;
axis([ td tf -A1-A2 A1+A2]);
title('Notre signal:')
xlabel('t(s)');
ylabel('x');

subplot(3,2,3);hold on;
plot(v,real(X1));grid on;
title('La partie reelle de la TFD de x gradue en Hz:');
xlabel('v(kHz)');
ylabel('X1');

subplot(3,2,4);hold on;
plot(v,imag(X1));grid on;
title('La partie imaginaire de la TFD de x gradue en Hz:');
xlabel('v(kHz)');
ylabel('X1');

subplot(3,2,5);hold on;
plot(v,abs(X1));grid on;
title('Le module de la TFD de x gradue en Hz:');
xlabel('v(kHz)');
ylabel('X1');

subplot(3,2,6);hold on;
plot(v,imag(X1));grid on;
title('L angle de la TFD de x gradue en Hz:');
xlabel('v(kHz)');
ylabel('X1');
