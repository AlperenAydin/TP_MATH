clear all;close all;
v =rand(20,1);
indices=find(v<0.8 & v>0.3);
line1 = ones(20,1) * 0.8;
line2 = ones(20,1) * 0.3;
 

subplot(2,1,1);
plot(v,'c*');
hold on;
plot([line1,line2]);

v(indices) = 1;
subplot(2,1,2);
plot(v,'c*');
hold on;
plot([line1,line2]);