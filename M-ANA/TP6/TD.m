clear all;close all;hold on;
a=2;b=4;
u=[-5:0.1:5];
v=u;
[U,V]=meshgrid(u,v);

W=a*b*sinc(a*U).*sinc(b*V);
mesh(U,V,W);