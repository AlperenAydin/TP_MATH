clear all;
close all;
hold on ;

u=[1,1];
u=u/2;
v=u;

figure(1);
hold on;

for i=2:10
    plot(v);
    v=conv(v,u);
end