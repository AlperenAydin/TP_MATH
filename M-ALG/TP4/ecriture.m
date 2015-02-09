function ecriture(str)
    l = length(str)
    
    curseur_x = 0; 
    
    for i = 1:l;
        c = str(i);
        if(c != ' ') % c est un lettre
            filename = ['lettres/',c,'.mat']; % Les lettres se trouve
                                          % dans un dossier 'lettres'
            load(filename,'X','Y');         
            courbeBezier(X+ curseur_x, Y+ curseur_y);
        end
        curseur_x += 1; % On increment de 1 pour avoir du place
                        % pour ecrire la prochaine lettre
    end;
    
    % Note: On n'a pas les armature pour chaque lettre
    
endfunction