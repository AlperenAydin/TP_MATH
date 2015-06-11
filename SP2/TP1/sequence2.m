function [t,x,M] = sequence2(A1,A2,v1,v2,phs1,phs2,td,tf,ve)

    t = td: 1/ve: tf;
    M = length(t);
    
    % Voir le compte-rendu pour explication de changement 
    % de frequence et phase
    ph1 = 2*pi*v1*td + phs1*pi/180; 
    [~,x1] = sequence1(A1,v1/ve,ph1,0,M-1);
    
    ph2 = 2*pi*v2*td + phs2*pi/180; 
    [~,x2] = sequence1(A2,v2/ve,ph2,0,M-1);
    
    x = x1 + x2;
end