function main ()
clear all;
close all;
hold on;

tmin=-5;tmax=5;pas=0.1;
t=[tmin:pas:tmax];
n=length(t);

f0=(1+t.^2).^(-1);
f=f0+0.05*randn(1,n);

figure(1);
plot(t,f)

f05=conv(f,porte(t,5));
f1=conv(f,porte(t,4));
f2=conv(f,porte(t,2));
f3=conv(f,porte(t,3));

figure (2);
plot(t,f0);
hold on;
pas=0.05;
t1=[tmin:pas:tmax];
plot(t1,[f05;f1;f2;f3]);
legend('Signal original',' 0.5',' 1');

figure (3);

subplot(2,2,1);
plot(t,f0);
hold on;
plot(t1,f05);


subplot(2,2,2);
plot(t,f0);
hold on;
plot(t1,f1);

subplot(2,2,3);
plot(t,f0);
hold on;
plot(t1,f2);

subplot(2,2,4);
plot(t,f0);
hold on;
plot(t1,f3);

end

function y=porte(t,a)
y=(abs(t)<a/2)/a;
end