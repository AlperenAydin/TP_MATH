clear all; close all; clc;


format long;        % format double précision
f=@(x)(1./(x.^2-x+1)-0.5);  % la fonction f(x) = 1/(x^2-x+1) - 0.5
fp=@(x)(-(2*x-1)./(x.^2-x+1).^2);
hold on;


a=3.5;
t=-a:0.01:a;
plot(t,f(t),'r','linewidth',2,'linesmoothing','on');
plot([-a,a],[0,0]); plot([0,0],[-0.5,1]);
x0 = 2; % faire differents essais, par ex. x0= 1.6, x0 = -2.43 ...
x  = x0;
n  = 20;


for k=0:n
   fprintf('%18.15f \r',x);
   text(x+0.05,-0.03,['\fontsize{12}x_',num2str(k)]);
   xk = x-f(x)/fp(x);
   plot([x,x,xk],[0,f(x),0],'linewidth',2); hold on;
   x=xk;
end;