function exercice1(M,nue,N)
    X = 5;
    
    %% Generation du signal
    [s,t,OK] = gene(X,M,nue);
    OK
    %% Calcul de TFD-N points
    S = fft(s,N);
    
    %% Affichage du signal
    subplot(2,1,1);
    plot(t,s);grid on; 
    
    title(['Le signal ',num2str(X),' genere avec M=',num2str(M),' echantillons et nue =',num2str(nue)]);
    xlabel('t');
    ylabel('s(t)');
    
    %% Affichage du module du spectre
    subplot(2,1,2);
    S1 = S (1:(N/2));
    nu = linspace(0,(nue/2),N/2);
    plot(nu,abs(S1));grid on;
    
    title(['Le module du spectre pour N=',num2str(N)]);
    xlabel('nu (Hz)');    
    ylabel('|S(nu)|');
    
    
end