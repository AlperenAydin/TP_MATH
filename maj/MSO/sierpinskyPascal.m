function sierpinskyPascal(N)
hold on;
for n = 0:N
   for k=0:n
      b = nchoosek(n,k);
      if(mod(b,2) == 0)
          plot(n,k,'r*');
      else
          plot(n,k,'ob');
      end
   end
end

end