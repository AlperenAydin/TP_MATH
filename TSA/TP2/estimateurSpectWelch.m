function estimateurSpectWelch(X, N, Nom_fenetre, M, NOVERLAP, NFFT)
    %% Estimation de DSPM via estimation de Welch    
    
    % Une estimation avec un fenetre 'Non_fenetre'
    % equivaut une estimation moyenné
    Xi = X(1:N);
    eval(['fenetre=',Nom_fenetre,'(M);']);
    [Pxx, F] = pwelch(Xi,fenetre,NOVERLAP,NFFT,1,'twosided');
    
    %% DPSM theorique et Biais
    [Gth,Gbiais,f] = sptheo(M,'welch',Nom_fenetre); 
    
    %% Affichage
    Pxx_db = 10*log10(Pxx);
    l = length(F);
    
    plot(F(1:l/2),Pxx_db(1:l/2),f,Gth,f,Gbiais);
    axis([0 0.5 -50 10]);
    legend('DPSM estimee','DPSM theorique','Esperance de DPSM estimee');
    titre= sprintf('DSPM theorique et estimée via estimateur de Welch avec le fenetre %s, N= %d, tranches de %d, %d recouvrements \n et esperance de DPSM estimee',Nom_fenetre, N, M, NOVERLAP);
    title(titre);
    xlabel('f');
    ylabel('dB');

end