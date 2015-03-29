function [X,Y] = loiNormale(N,moy,ecart)
    
    % rand(x,y) donne une matrice x*y avec des valeurs dans [0,1]
    to = 2*pi*rand(1,N);
    
    r = sqrt(-2*log(1-rand(1,N)));
    
    % VA suivant N(0,1)
    X = r .* cos(to);
    Y = r .* sin(to);
    
    % VA suivant N(moy,ecart)
    X = (X*ecart)+moy;
    Y = (Y*ecart)+moy;
    

end
