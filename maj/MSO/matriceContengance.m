function C = matriceContengance(dim)
    if(dim == 1)
       C = [0,1;1,0]; 
    else
       C0 = matriceContengance(dim-1); 
       Id = eye(2^(dim-1));
       C = [C0,Id;Id, C0];
    end

end