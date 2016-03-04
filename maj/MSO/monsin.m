function y = monsin(x)
    if(x > 0.001)
        X = monsin(x/2);
        y = 2*X*sqrt(1-X^2);
    else
        y = x;
    end
end