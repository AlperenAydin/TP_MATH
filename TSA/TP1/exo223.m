close all; clear all;

N = 1000;
Fs = 1*10^3; Ts = 1/Fs;
B= 100; 
m3 = 7; sig3 = 3;
[ x1, x2, x3, a, b ] = syntheseSA(N, B, m3, sig3);
figure(1);


M = [3,5,20,80,100, 250,  500]
for i = 1:7
    subplot(2,4,i);
    [p1, X1] = calcul_dhistogr( x1, M(i) ); hold on;
    p_th1 = (1/sqrt(2*pi)) *exp (-(X1.^2)/2);
    plot(X1,p_th1);
    
end

subplot(2,4,8);
[p1, X1] = calcul_dhistogr( x1 ); hold on;
p_th1 = (1/sqrt(2*pi)) *exp (-(X1.^2)/2);
plot(X1,p_th1);
    