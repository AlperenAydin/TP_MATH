close all; clear all; clc; hold on;


N = 20;

Im = zeros(N,N);
for n = 1:N
   for k = 1:n
       if (mod(n,2) == 1 && mod(k,2) == 1)
           s = subsets(1:n,k);
           s  = sum(s, 2);
           f = length(find( mod(s,2) == 1));
           if(mod(f,2) == 1)
               Im(n,k) = 10;
           else
               im(n,k) = 1;
           end
       end
   end
end

imshow(Im);