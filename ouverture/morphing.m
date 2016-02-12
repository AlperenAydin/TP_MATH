close all; clear all; clc;

M = 10;
t = -M:0.1:M;
l = length(t);
A = [(1-t.^2)./(1+t.^2); (2*t)./(1+t.^2)];
B = [cos(2*t);sin(3*t)];
%B = squarePAra
F = 1;
i =0;
figure();hold on;
for a=0:0.1:1
    M = ones(2,l);
    for k = 1:length(t)
        M(:,k) = a*A(:,k) + (1-a)* B(:,k);
    end
    d = max(M(1,:)) - min(M(1,:));
    plot(M(1,:) + d*i, M(2,:));
    M = [M; a*ones(1,l)];
%    plot3(M(1,:),M(2,:),M(3,:));
    if(F == 1)
        F = M;
    else
        F = [F, M];
    end
    i = i+1;
end

figure();
plot3(F(1,:),F(2,:),F(3,:));



