function subs = subsets(l, n)
if(n == 1)
    subs = zeros(length(l),1);
    for i = 1:length(l)
        subs(i) = l(i);
    end
else
    subs = [];
    for i = 1:(length(l)-1);
       s = subsets(l(i+1:end), n-1);
       [X, Y] = size(s);
       for x = 1:X
           temp = [l(i), s(x,:)];
           subs = [subs; temp]; 
       end    
    end
end
end