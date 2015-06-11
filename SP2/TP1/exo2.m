clear all; close all; hold on;

A1 = 8; A2 = 5;
v1 = 271; v2 = 1147;
phs1 = 25; phs2 = 38;
td = -8.1*(10^(-3)); tf = 12.05*(10^(-3));
ve = 5000;

[t,x,M,x1,x2] = sequence2(A1,A2,v1,v2,phs1,phs2,td,tf,ve);

stem(t*(10^3),x);grid on;
axis([ td*(10^3) tf*(10^3) -A1-A2 A1+A2]);
xlabel('t(ms)');
ylabel('x');
title('La somme de deux signaux sinusoidales');