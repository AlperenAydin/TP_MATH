clear all; close all; hold on; 


[k1,x1] = sequence1(2,1/22,pi/2,0,25); %% 1/22 car 2*pi*f0 = pi/11 => f0 = 1/22
[k2,x2] = sequence1(-4,1/22,0,-15,15);
[k3,x3] = sequence1(1,2/35,pi/5,-10,10);
[k4,x4] = sequence1(-1,1/(2*sqrt(19)),pi/2,0,50);

subplot(2,2,1);
stem(k1,x1);
title('x1(k)=2cos(pi/11 k) 0<= k <= 25');grid on;
xlabel('k');
ylabel('x');
axis( [0 25 -2 2]);


subplot(2,2,2);
stem(k2,x2);
title('x2(k)=-4sin(pi/11 k) -15 <= k <= 15');grid on;
xlabel('k');
ylabel('x');
axis( [-15 15 -4 4]);

subplot(2,2,3);
stem(k3,x3);
title('x3(k)=sin(4*pi/35 k + pi/5) -10 <= k <= 10');grid on;
xlabel('k');
ylabel('x');
axis( [-10 10 -1 1]);

subplot(2,2,4);
stem(k4,x4);
title('x4(k)=-cos(pi/sqrt(19) k) -0 <= k <= 50');grid on;
xlabel('k');
ylabel('x');
axis( [ 0 50 -1 1]);