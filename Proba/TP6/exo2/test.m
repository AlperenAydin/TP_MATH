clear all; close all; 


N = 5000000;
a = 1; b = 2;
k = 100;
x = linspace(a,b,k);

figure(1); hold on; grid on;

X = loiUniforme(N,a,b);
Y = loiUniforme(N,a,b);

xh = hist(X,x);
yh = hist(Y,x);

bar(x,xh*k/N);

figure(2); hold on; grid on;
% La Somme:

% Empirique:
S = X+Y; 
t = linspace(2,4,k);
sh = hist(S,t);

bar(t,sh*k/(2*N));

% Theorique:
st = 1 - abs(t -3);
plot(t,st,'r','lineWidth',2);


figure(3);hold on; grid on;
% Le Produit:

% Empirique:
P = X.*Y; 
t = linspace(1,4,k);
ph = hist(P,t);

bar(t,ph*k/(3*N));

%Theorique:
pt = zeros(1,k);
for i = 1:k
    if(t(i) <= 2)
       pt(i) = log( t(i)) ;      
    else
        pt(i) = 2*log(2) - log(t(i));        
    end
end

plot(t,pt,'r','lineWidth',2);


figure(4);hold on; grid on;
 % Le Quotient

Q = X ./Y;
q = linspace(1/2,2,k);
qh = hist(Q,q);

bar(q,qh*k/(1.5*N));

qt = 2- 1./(2 * q.^2);
plot(q,qt);



