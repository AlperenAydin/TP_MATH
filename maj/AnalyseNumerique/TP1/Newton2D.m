close all; clear all;


f1   = @(x,y) (y - 0.5*(exp(x/2) + exp(-x/2) ));
df1x = @(x,y) ((-0.25) * (exp(x/2) - exp(-x/2)));
df1y = @(x,y) (1);

f2   = @(x,y) (9*x^2 + 25*y^2 - 225);
df2x = @(x,y) (18*x);
df2y = @(x,y) (50*y);


x = linspace(-5,5,100);
y1 = 0.5*(exp(x/2) + exp(-x/2));
y2 = 3*sqrt(1-(x.^2)/25);
plot(x,y1, x,y2);


J = @(x,y) ([df1x(x,y), df1y(x,y); df2x(x,y), df2y(x,y)]);

X0 = [4
       4];
X = X0;
i = 1;
Xi = X(:,i);
x = Xi(1); y = Xi(2);
Delta = J(x,y)\[-f1(x,y), -f2(x,y)]';
X = [X, Xi + Delta ];
i = i +1;
tol = (norm(X(:,i) - X(:,i-1)))/norm(X(:,i-1));

while(tol > 0.0001)
    Xi = X(:,i);
    x = Xi(1); y = Xi(2);
    Delta = J(x,y)\[-f1(x,y), -f2(x,y)]';
    X = [X, Xi + Delta ];
    i = i +1;
    tol = (norm(X(:,i) - X(:,i-1)))/norm(X(:,i-1));
end
























