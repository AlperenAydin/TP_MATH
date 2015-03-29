clear all; close all; hold on; grid on;

k=[3,4,5,6,7,8];
P=[1,1,1,1,1,1]/6;

mx = max (k);
mn = min (k);
figure(1);

subplot(3,1,1);
bar(k, P);
title('La loi initale');
xlabel('k');
ylabel('P');

moy=sum(k.*P);

var=sum((k.^2).*P)-moy^2;
ecart=sqrt(var);

prodConv=conv(P,P);

subplot(3,1,2);
bar(2*mn:2*mx, prodConv);
title('Addition de 2 variables aleatoire');
xlabel('k');
ylabel('P');

n=10;
fXn=P;

for i=2:n

   fXn=conv(fXn,P);

end

x=[n*mn:n*mx];

subplot(3,1,3);
bar(x,fXn);hold on;


% question d

moyTh=moy*n;
ecartTh=ecart*sqrt(n);

% question e

fX=loi_normale(moyTh, ecartTh, x);
plot(x, fX);hold on;
title('Addition de 10 variables aleatoires')
xlabel('k');
ylabel('P');

