clear all; close all; hold on ; 

n = 200;
y=rand(1,n);
x= y+ 2*rand(1,n);
X = x- mean(x);
Y = y- mean(y);

scatter (X,Y,20, 'filled');

theta = [0 :0.01:pi];
l     = length (theta);
S     = zeros(1,l);

for i =1:l
    for k =1:n
        S(i) = S(i)+(X(k)*cos(theta(i)) +Y(k)*sin(theta(i)))^2;
    end
end

theta_max = theta (find( S==max(S)));
theta_min = theta (find( S==min(S)));