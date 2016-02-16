function n= intersection(P1, P2 ,a,b)
% Algorithme donnée par J.M BECKER
    C = [a;b];
    d1= dedans(P1(1), P1(2), a,b);
    d2= dedans(P2(1), P2(2), a,b);
  
    n = 0;
    % n est le nombre d'intersections
    % Si il verifie aucun des conditions suivantes, il y a aucune
    % intersection
    if(d1*d2 < 0 )
        % Dans ce cas, un des point est dans le cercle
        n = 1;
    elseif(d1>0 && d2>0)
        lamb = -dot(P2-P1, P1-C)/(norm(P2-P1).^2);
        Q = P1 + lamb*(P2-P1);
        if norm(Q-C)<1
            % Dans ce cas, la ligne entre les point passe pasr le cercle
            n = 2;
        end
    end
end