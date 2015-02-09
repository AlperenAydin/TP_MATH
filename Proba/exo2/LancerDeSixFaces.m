function y = LancerDeSixFaces(n)
    y =zeros(1,n);
    for i = 1:n
        y(i) = randi(6);
    end
end