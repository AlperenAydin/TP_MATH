
function main() 
clear all;
close all;

format long;
step=0.01;
xmin=0;
xmax=50;
n=4;
a=2;
I=Simpson(@(x)myfun(x,n,a),xmin,xmax,step)


function y=myfun(x,n,a)
y=(x.^n).*exp(-x*a);

function I=Simpson(f,a,b,step)
x1=[a:step:b];
y1=f(x1);
n1=length(x1);
x2=[a+step/2:step:b-step/2];
y2=f(x2);
I=step*((2*sum(y1)-y1(1)-y1(n1))/6+2*sum(y2)/3);