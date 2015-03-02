function testUniforme(N,n)

Uniforme = zeros(1,N);
for i = 1:N
    Uniforme (i) = LoiUniforme(n);
end

x1 = hist(Uniforme,[1:n]);
bar(x1/N,'r'); hold on;

theo =(1/n)*ones(1,n); 
bar(theo,0.5,'g');hold on;

legend('Empirique','Theorique');

end