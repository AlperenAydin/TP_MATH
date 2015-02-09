function y = jeuA (N)

    compteur  = 0;
    for i = 1:N
        des = LancerDeSixFaces(4);
        six = find( des ==6);
        if(length (six) > 0)
            compteur = compteur +1;
        end
    end
    
     y = compteur/N;
end