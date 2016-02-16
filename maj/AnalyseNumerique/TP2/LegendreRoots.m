function R = LegendreRoots(n)
    k = 1:n-1;
    D = k./sqrt(4*k.^2 -1);
    M = diag(D,1) + diag(D,-1);
    R = roots(poly(M));
end