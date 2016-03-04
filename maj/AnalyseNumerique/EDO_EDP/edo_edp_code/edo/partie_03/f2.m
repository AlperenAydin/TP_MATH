function [fx,fy] = f2(x,y)

alpha = 1; beta = 0.5; gamma = 2; delta = 1;

fx = alpha*x - beta*x.*y;
fy = delta*x.*y - gamma*y;