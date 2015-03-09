clear all;close all; hold on; grid on;

p=0.1;
n=50;

nb=9999;

% coordonnées colorées
Xc=zeros(n+1,nb);      
Yc=zeros(n+1,nb);

for i=1:nb
   
    [X,Y]=traj_particule (p,n);
    Xc(:,i) = X;
    Yc(:,i) = Y;
    
end

figure(1);
plot(Xc,Yc);

%La courbe x+y= n
x = 0:n/20:(n);
y = (n)-x;
plot(x,y);

%Binomiale
Y = max(Yc);

Moy = mean(Y);
Ecart = std(Y);

%histogrammes

absY = 0:n;

figure(2);
y1 = hist(Y, absY);
bar(absY, y1/nb); hold on;

k = absY;
q=1-p;

theo = zeros(1,n+1);
for i=1:n+1
   theo(i) = nchoosek(n,k(i)) * (q^k(i) ) * (1-q)^(n -k(i));  
end

bar(absY,theo,0.5,'g');hold on;
legend('Empirique','Theorique');