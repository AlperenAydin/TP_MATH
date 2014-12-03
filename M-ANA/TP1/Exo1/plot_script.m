clear all;
close all;

x=0:0.1:2*pi;
y1=sin(x);
y2=sin(2*x);

figure(1);

subplot(2,2,1);
plot(x,y1,'*r',x,y2,'ob');

subplot(2,2,2);
plot(x,y1,'r',x,y2,'b');
axis equal;
xlabel('x');
ylabel('f(x)');

subplot(2,2,3);
plot(x,y1,'*r-',x,y2,'ob-');
axis([0,2*pi,-1,1]);
xlabel('x');
ylabel('f(x)');
title('Fonction graphique plot');



subplot(2,2,4);
hold on;
plot(x,y1,'color',[1,1,0], 'linewidth' ,3);

plot(x,y2,'color',[1,0,1],'linewidth',4);
axis([0,2*pi,-1.2,1.2]);
xlabel('x');
ylabel('f(x)');
title('Fonction graphique plot');
legend('sin(x)','sin(2x)');


figure(2);
hold on;
x=0:0.01:2*pi;
% on a changé la valeur du pas
z=sin(x).*sin(2*x);
% on remarquera le .*
plot(x,z,'color',[0,0,0],'linewidth',3);
