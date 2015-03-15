function y = jeuB (N)

    compteur  = 0;
    for i = 1:N
        des1 = LancerDeSixFaces(24);
        des2 = LancerDeSixFaces(24);
        			% On stimule la lance de deux des
        six1 = find(des1 == 6);
        six2 = find(des2 == 6);
        			% On cherche a voir si on a obtenu un double-six
        B = intersect (six1,six2);
        if (length (B) > 0)
            compteur = compteur +1;
        end
    end
    
     y = compteur/N;
end
