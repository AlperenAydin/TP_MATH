close all; clear all; clc;

N = 1e2;
tel = zeros(1,N);
tsqr = zeros(1,N);
for a = 1:N
   tel(a) = (abs(exp(log(a)) - a)) /eps;
   
   tsqr = (abs( sqrt(a^2) - a) ) / eps;
end
figure()
plot(1:N,tel);
title('Erreur d''exp(ln)');

figure();
plot(1:N,tsqr);
title('Erreur de sqrt(sqr)')