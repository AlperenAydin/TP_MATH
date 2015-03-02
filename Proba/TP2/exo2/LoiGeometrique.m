function n = LoiGeometrique(p)

    compteur = 0;
    
    x =LoiBernoulli(p);
    while x == 1
        compteur = compteur + 1;
        x = LoiBernoulli(p);
    end 
    n= compteur;
end