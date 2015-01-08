function main()
clear all;
close all; 
hold on;
for a=0.1:0.05:4
    I=Simpson(@(t)myfun(t,a),0,500,0.01);
    plot(a,log(I),'*k');
    xlabel('a');
end

a=[0.1:0.05:4];
l=-(a*0.9949)+0.4375;
plot(a,l);

end

function y=myfun(t,a)
y=(t./(1+t.^2)).*sin(a*t);
end

function I=Simpson(f,a,b,step)
x1=a:step:b;
y1=f(x1);
n1=length(x1);
x2=a+step/2:step:b-step/2;
y2=f(x2);
I=step*((2*sum(y1)-y1(1)-y1(n1))/6+2*sum(y2)/3);
end