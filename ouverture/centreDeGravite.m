close all; clear all; hold on;

pause on;
fig1 = figure(1);
[X, Y] = getline(fig1);
X = X -X(1);
Y = Y -Y(1);
Z = X + 1i*Y;
l = length(Z);

%%figure(2);
%plot(Z);

n = 2;
cdg = zeros(l-2,1); aire=zeros(l-2,1);
while(n<l)
    cdg(n-1)  = (1/3) * (Z(n) + Z(n+1));
    aire(n-1) = 0.5 * (X(n)*Y(n+1) - Y(n)*X(n+1));
    plot(cdg,'b o');
    plot ([Z(1),Z(n), Z(n+1), Z(1)]);
    
    cdg_global = (aire' * cdg)/sum(aire);
    plot(cdg_global, 'r*');
    
    
    pause(1);
    n = n+1;
end

cdg_global = (aire' * cdg)/sum(aire);
plot(cdg_global, 'r*');