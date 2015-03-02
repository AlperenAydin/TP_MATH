function testBernoulli (N,p)

Bernoulli = zeros(1,N);
for i = 1:N
    Bernoulli (i) = LoiBernoulli(p);
end
abs = [0,1];

x1 = hist(Bernoulli,abs);
bar(abs, x1/N,'r'); hold on;

theo =[1-p,p]; 
bar(abs,theo,0.5,'g');hold on;

legend('Empirique','Theorique');

end