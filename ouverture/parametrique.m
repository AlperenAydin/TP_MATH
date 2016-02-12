close all; clear all; clc; hold on;


%% Construction d'un conique arbitraire
M = 10^4;
N = 5;
t = -M: 0.01: M;
for j = 1:N;
    
    
    a = rand;
    b = rand;
    c = rand;
    d = rand;
    e = rand;
    f = rand;
    
    i = 0;
    g = 0;
    h = 0;
    while( h^2 -4*g >= 0)
       g = rand;
       h = rand;
    end
    
    denom = g*t.^2 + h*t + i;
    x = (a*t.^2 + b*t + c)./denom;
    y = (d*t.^2 + e*t + f)./denom;
    axis([-10, 10, -10, 10]);
    plot(x,y);
    
end


A = [x; y];