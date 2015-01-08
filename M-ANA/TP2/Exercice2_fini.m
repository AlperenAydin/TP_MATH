function Exercice2() 
hold on;

format long;

step=0.01;

N=15; %No de Harmoniques


%Les donnes du systeme
L=1.0;
T0=350.0;
T1=700.0;
T2=500.0;

alpha= 2.28*(10^-5);
b0=zeros(1,N); %b0 correspond a bn(t=0) pour des valeur de n different

for n=1:N
    b0(1,n)=Simpson(@(x)f1(x,T0,T1,L,n),0,L/2,step);
    b0(1,n)=b0(1,n)+Simpson(@(x)f2(x,T1,T2,L,n),L/2,L,step);
end

b0=2*b0; %L=1

x=[0:0.01:L]; %les absissces
t=[1,50,200,600,1800,3600]; %Les temps que nous chercherons
b=zeros(length(t),N); %Lines correspond to x, coloums to T.

%Calcul des coefficient de Fourier pour t differents
for n=1:N
    b(:,n)=b0(n)*exp((-(n*pi)^2)*alpha*t');
end

u=zeros(length(t),length(x)); %Les temperatures pour les t differents

for n=1:N
    u=u + b(:,n)*sin(n*pi*x);
end

figure(1);

ti = sprintf('Barre en fer: L= %d m, T_0= %d K, T_1= %d K, T_2= %d K, alpha = %f, N= %d',L,T0,T1,T2,alpha,N);
plot(x,u,'LineWidth',0.75);
title(ti);
legend('t=1s','t=50','t=200','t=600','t=1800','t=3600');
xlabel('x');
ylabel('T');

nu=[1:N]/(2*L);
ab=abs(b);

figure(2);
bar(nu, ab', 0.4);
legend('t=1s','t=50','t=200','t=600','t=1800','t=3600');
title(ti);
xlabel('v_n');
ylabel('A_n');
end


%f1 correspond a la partie lors que x<L/2
function y=f1(x,T0,T1,L,n)
y=(T0+2*(T1-T0)*x/L).*sin(n*pi*x/L);
end

%f2 correspond a la partie lors que L/2 < x <L
function y=f2(x,T1,T2,L,n)
y=(2*T1-T2+2*(T2-T1)*x/L).*sin(n*pi*x/L);
end 

function I=Simpson(f,a,b,step)
x1=[a:step:b];
y1=f(x1);
n1=length(x1);
x2=[a+step/2:step:b-step/2];
y2=f(x2);
I=step*((2*sum(y1)-y1(1)-y1(n1))/6+2*sum(y2)/3);

end
