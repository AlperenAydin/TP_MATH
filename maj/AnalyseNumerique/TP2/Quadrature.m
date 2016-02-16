function r =Quadrature(f,X,W)

[x,~] = size(X);
if(x ~= 1 )
    X = X';
end
[~,y] = size(W);
if(y ~=1)
    W = W';
end


r = (f(X))*W;

end