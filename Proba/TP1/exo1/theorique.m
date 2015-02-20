function x = theorique (n)

    arrangement=1;
    for i= 1:n
        arrangement = arrangement*(366-i);
    end    
    t = arrangement / (365^n);
    x = 1-t ;
end