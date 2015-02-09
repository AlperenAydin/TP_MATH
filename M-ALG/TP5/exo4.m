clear all; close all; hold on; 

n = 4;
intervalle=linspace(-1,1,n);

M =rot90(vander(intervalle));

C =zeros(n,1)
for i = 0:n-1
    
    i
    monome = @(x)(x.^i);
    C(i+1) = integral(monome,-1,1)
end

inv(M)*C