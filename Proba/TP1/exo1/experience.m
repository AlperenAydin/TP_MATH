function x = experience(n)

    N = 5000;
    compteur =0;
    for l = 1:N
        anniversaires = zeros (1,n);
        for i =1:n  % on randomise un tableau
            anniversaires(i) = randi(365);
        end
        
        repeating = 0;        
        for i = 1:n % On cherche les termes re repetant
            j = anniversaires (i);
            m = find ( anniversaires == j); % Si j se repete
            if (length (m) > 1)             % la longeur de m est plus grand
                                            % que 1
                repeating =1;
            end
                     
        end
        compteur = compteur+repeating;
        
    end
    x= compteur/N;
    

end