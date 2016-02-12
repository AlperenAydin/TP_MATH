function el = tabPop(T)
    i = 1;
    
    while(T(i).isempty())
        i = i + 1;
    end
    el = T(i).pop();
end