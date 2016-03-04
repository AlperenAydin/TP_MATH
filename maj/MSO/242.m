close all, clear all, clc; hold on;


N = 10;


for n = 1:N
   for k = 1:n
       if (mod(n,2) == 1 && mod(k,2) == 1)
           s = subsets(1:n,k);
           s  = sum(s');
           f = length(find( mod(s,2) == 1));
           if(mod(f,2) == 1)
               plot(n,k,'*r');
           else
               plot(n,k,'ob');
       end
   end
end

