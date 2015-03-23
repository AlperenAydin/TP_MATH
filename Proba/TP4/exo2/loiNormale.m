function [X,Y] = loiNormale(N)

    to = 2*pi*rand(1,N);
    
    r = sqrt(-2*log(1-rand(1,N)));
    
    X = r .* cos(to);
    Y = r .* sin(to);
    
    

end
