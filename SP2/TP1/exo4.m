clear all; close all; hold on;

A1 = 8; A2 = 5;
v1 = 271; v2 = 1147;
phs1 = 90; phs2 = 90;
td = -10.12*(10^-3); tf = 10.12*(10^-3);
ve = 5000;

[t,y,M] = sequence2(A1,A2,v1,v2,phs1,phs2,td,tf,ve);

figure(1);
subplot(2,4,1:4);
stem(t*(10^3),y);grid on;
axis([ td*(10^3) tf*(10^3) -A1-A2 A1+A2]);
title('Notre signal:')
xlabel('t(ms)');
ylabel('x');

N = 512;
x = [y(M/2:M) , zeros(1,N-M), y(1:(M/2)-1) ];

Y = fft(x,N);
v= linspace(0,ve/1000,N);
subplot(2,4,5);grid on;
plot(v,real(Y));
title('La partie reelle de la TFD de x gradue en Hz:');
xlabel('v(kHz)');
ylabel('Y');

subplot(2,4,6); grid on;
plot(v, imag(Y));
title('La partie imaginaire de la TFD de x gradue en Hz:');
xlabel('v(kHz)');
ylabel('Y');

subplot(2,4,7);grid on;
plot(v,abs(Y));
title('Le module de la TFD de x gradue en Hz');
xlabel('v(kHz)');
ylabel('Y');

subplot(2,4,8);grid on;
plot(v,angle(Y));
title('Le phase de la TFD de x gradue en Hz');
xlabel('v(kHz)');
ylabel('Y');

figure(2);

plot3(v,real(Y),imag(Y));