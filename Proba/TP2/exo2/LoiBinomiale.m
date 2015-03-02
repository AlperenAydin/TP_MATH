function nbSucces = LoiBinomiale(n,p)
    compteur = 0;
    for i = 1:n
        compteur = compteur + LoiBernoulli(p);
    end
    nbSucces = compteur;
end