function estimateurSpectWelch_modifiee(X, N, Nom_fenetre, M, NOVERLAP, NFFT)
    %% Estimation de DSPM via estimation de Welch    
    
    % Une estimation avec un fenetre 'Non_fenetre'
    % equivaut une estimation moyenné
    Xi = X(1:N);
    eval(['fenetre=',Nom_fenetre,'(M);']);
    [Pxx, F] = pwelch(Xi,fenetre,NOVERLAP,NFFT,1,'twosided');
    
    %% Affichage
    l = length(F);
    
    semilogy(F(1:l/2),Pxx(1:l/2));
    axis([0 0.5 -50 10]);
    legend('DPSM estimee');
    titre= sprintf('DSPM estimée via estimateur de Welch avec le fenetre %s, N= %d, tranches de %d, %d recouvrements',Nom_fenetre, N, M, NOVERLAP);
    title(titre);
    xlabel('f');
    ylabel('dB');

end