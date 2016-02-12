close all; clear all; clc;

p0 = [1, -3, 1, +3, -2];
r  = [];

p = p0;
while(length(p) > 2)
    n= length(p);
    P = @(x) (polyval(p,x));
    
    
    u = p(2)/p(1);
    v = p(3)/p(1);
    X = [u;v];
    
    pu = [1, u, v];
    [q1, r1] = deconv(p,pu);
    [q2, r2] = deconv(q1,pu);
    
    c = r1(end-1);
    d = r1(end);
    Y = [c;d];
    if (length(r2) >= 2)
        g = r2(end-1);
        h = r2(end);
    else
        g=0;
        h=r2(end);
    end
    
    
    k = 1/(v*(g^2) + h*(h-u*g));
    M = [-h, g ; -g*v, g*u-h];
    
    X0 = X;
    X = X0 - k*M*Y;
    dif = norm(X-X0) / norm(X0);
    while(dif > 1e-4)
        X0 = X;
        X = X0 - k*M*Y;
        dif = norm(X-X0) / norm(X0);
    end
    u = X(1);
    v = X(2);    
    
    pu = [1, u, v];
    r = [r, roots(pu)'];
    [p, r0] = deconv(p,pu);
    
end
