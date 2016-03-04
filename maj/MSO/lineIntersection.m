function I = lineIntersection(P, Q, R, S)
    M1(:,1) = S-P; M1(:,2) = R-P;
    M2(:,1) = S-Q; M2(:,2) = R-Q;
    
    
    k = det(M1)/det(M2);
    
    I = Q*k/(k-1) - P/(k-1);
    

end