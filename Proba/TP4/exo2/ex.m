clear all; close all; hold on; grid on;

k=[3,4,5,6,7,8];
P=[4,1,3,7,2,3]/20;

figure(1);

subplot(3,1,1);
bar(k, P);

moy=sum(k.*P);

var=sum((k.^2).*P)-moy^2;
ecart=sqrt(var);

prodConv=conv(P,P);

subplot(3,1,2);
bar(6:16, prodConv);

n=10;
fXn=P;

for i=2:n

   fXn=conv(fXn,P);

end

x=[3*n:8*n];

subplot(3,1,3);
bar(x,fXn);


% question d

moyTh=n*moy;
ecartTh=n*ecart;

% question e

fX=loi_normale(moyTh, ecartTh, x);
plot(x, fX);



