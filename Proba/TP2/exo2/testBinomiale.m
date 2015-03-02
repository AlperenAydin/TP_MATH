function testBinomiale (N,n,p)

Binomiale= zeros(1,N);
for i = 1:N
    Binomiale (i) = LoiBinomiale(n,p);
end

abs = 0:n;

x1 = hist(Binomiale,abs);
bar(abs, x1/N,'r'); hold on;

k = abs;
theo = zeros(1,n+1);
for i=1:n+1
   theo(i) = nchoosek(n,k(i)) * (p^k(i) ) * (1-p)^(n -k(i));  
end

bar(abs,theo,0.5,'g');hold on;

legend('Empirique','Theorique');

end