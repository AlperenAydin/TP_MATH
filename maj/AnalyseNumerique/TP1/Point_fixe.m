close all; clear all;

F = @(x)(x.*exp(0.5.*x) + 1.2*x - 5 );
G = @(x)(5./(exp(0.5.*x)+1.2));

x = linspace(-5,5,1000);
figure();
plot(x,F(x));
figure();
plot(x,G(x),x,x);

x0=2;
X = x0;
i =1;

xi = X(i);
x = G(xi);
X = [X, x];
i = i+1;
tol= abs((X(i) -X(i-1))/X(i-1));

while( tol > 0.001)
    xi = X(i);
    x = G(xi);
    X = [X, x];
    i = i+1;
    tol= abs((X(i) -X(i-1))/X(i-1));
end