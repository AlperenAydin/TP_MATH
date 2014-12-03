function main() 
clear all;
close all;
hold on;

format long;

step=0.01;

N=10;
b0=zeros(1,N);
L=1;
T0=400;
T1=700;
T2=600;
for n=1:N
    b0(1,n)=Simpson(@(x)f1(x,T0,T1,L,n),0,L/2,step);
    b0(1,n)=b0(1,n)+Simpson(@(x)f2(x,T1,T2,L,n),L/2,L,step);
end
x=[0:0.01:L]
t=[1,50,200,1800,3600];

b=zeros(6,length(x)); %Les lignes correspond different t, les coloums a x.
b(1,:)=b0;





function y=f1(x,T0,T1,L,n)
y=(T0+2*(T1-T0)*x/L).*sin(n*pi*x/L);

function y=f2(x,T1,T2,L,n)
y=(2*T1-T2+2*(T2-T1)*x/L).*sin(n*pi*x/L);

function I=Simpson(f,a,b,step)
x1=[a:step:b];
y1=f(x1);
n1=length(x1);
x2=[a+step/2:step:b-step/2];
y2=f(x2);
I=step*((2*sum(y1)-y1(1)-y1(n1))/6+2*sum(y2)/3);
