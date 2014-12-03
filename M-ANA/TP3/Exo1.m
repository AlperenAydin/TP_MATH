clear all;
close all;
hold on ;

u=[1,1];
v=u;

figure(1);
hold on;

for i=2:10 %eqiuvalnet en polynome <=> (x+1)^n
    plot(v);
    v=conv(v,u);
end

clear all;

figure(2);
hold on;

subplot(1,3,1);
x=[-75:1:74];
porte1= [zeros(1,50),ones(1,50),zeros(1,50)];
plot(porte1);
grid on ;

subplot(1,3,2);
porte2= [zeros(1,60),ones(1,30),zeros(1,60)];
plot(porte2);
grid on ;

subplot(1,3,3);
x=[-75:0.5:74];
plot(conv(porte1,porte2));
grid on ;
