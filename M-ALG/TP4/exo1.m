close all;clear all; hold on;

M = [2 -1 1
    -1 1 -1
     3 1 0 
    -2 -4 1
    -2 3 -1];

plot3(M(:,1),M(:,2),M(:,3));


N= M'*M;

[V,D]=eig(N);

X0 = V(:,1);
a=X0(1);b=X0(2);c=X0(3);

[Tx Ty] =meshgrid(-4:0.1:4);
Tz = (a*Tx + b*Ty)/(-c);
surf(Tx,Ty,Tz);
alpha(0.2);