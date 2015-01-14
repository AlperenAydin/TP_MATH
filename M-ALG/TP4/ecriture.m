function y = ecriture(str)

    curseur_x = 0 ; curseur_y = 0
    
    for c = str
        filename = ['lettres/',c,'.mat'];
        load(filename,'X','Y');
        courbeBezier(X+ curseur_x, Y+ curseur_y);
        
        curseur_x += 1;
    end
    
    
endfunction