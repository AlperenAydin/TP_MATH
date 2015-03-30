function [X,Y] = simulation(N)
    U = rand(1,N);
    V = rand(1,N);
    
    X = 2*U -1;
    
    Y = (2*sqrt(U.^2 + X.*(V-1)) -1)./X;

end