function estimateurSpectMoyenne_modifiee(X, N, M, NFFT)
    %% Estimation de DSPM via estimation moyenné    
    
    % Une estimation avec un fenetre rectangulaire
    % equivaut une estimation moyenné
    Xi = X(1:N);
    [Pxx, F] = pwelch(Xi,rectwin(M),0,NFFT,1,'twosided');
    
    %% Affichage
    l = length(F);
    
    plot(Pxx(1:l/2),F(1:l/2));
    axis([0 0.5 -50 10]);
    titre= sprintf('DSPM estimée via estimateur moyenné avec %d tranches de %d echantillons, NFFT =%d ',N/M,M,NFFT);
    title(titre);
    xlabel('f');
    ylabel('dB');

end