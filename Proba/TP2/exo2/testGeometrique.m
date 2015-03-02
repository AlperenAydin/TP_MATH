function testGeometrique (N,p)

Geometrique= zeros(1,N);
for i = 1:N
     Geometrique(i) = LoiGeometrique(p);
end

m = max(Geometrique);
abs = 1:m;

x1 = hist(Geometrique,abs);
bar(x1/N,'r'); hold on;

k = abs;
n = length(k);
theo = zeros(1,n);
for i=1:n
   theo(i) = ((1-p)^(k(i)-1) ) * p;  
end

bar(abs,theo,0.5,'g');hold on;

legend('Empirique','Theorique');

end