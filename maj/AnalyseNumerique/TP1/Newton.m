close all; clear all; 

f  =  @(x)(8-4.5*(x -sin(x)));
df =  @(x)(4.5*(-1 +cos(x)));


x0 = 2;
X  = x0;
i  = 1;
x  = X(i);
a  = df(x);
y  = f(x);
b  = y - a * x;
xi = -b/a;
X  = [X, xi];
i  = i+1;
tol= abs((X(i) -X(i-1))/X(i-1)); 
while(tol > 0.0001)
    x = X(i);
    a = df(x);
    y = f(x);
    b = y - a * x;
    xi = -b/a;
    X = [X, xi];
    i = i+1;
    tol= abs((X(i) -X(i-1))/X(i-1)); 
end