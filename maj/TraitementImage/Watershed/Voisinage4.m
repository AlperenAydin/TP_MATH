function pxs = Voisinage4(ind, H, W)
    s = [H, W];
    [i, j] = ind2sub(s, ind );
    
    I = [i-1, i, i+1];
    I = I(I>0 & I<=H);
   
        
    J = [j-1, j, j+1];
    J = J(J>0 & J<=W);
    
    pxs = sub2ind(s, I, j*ones(size(I)));
    pxs = [pxs, sub2ind(s, i*ones(size(J)) ,J)];
    pxs = unique(pxs);
end