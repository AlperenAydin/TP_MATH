close all; clear all;


Fs = 1*10^3; Ts = 1/Fs;
B= 100;
m3 = 7; sig3 = 3;

figure(1);

N = 2.^[4:12];

for i=1:8
    subplot(2,4,i);
    [ x1, x2, x3, a, b ] = syntheseSA(N(i), B, m3, sig3);
    [p1, X1] = calcul_dhistogr( x1); hold on;
    p_th1 = (1/sqrt(2*pi)) *exp (-(X1.^2)/2);
    plot(X1,p_th1);
end