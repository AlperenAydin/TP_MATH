function estimateurSpectMoyenne(X, N, M, NFFT)
    %% Estimation de DSPM via estimation moyenné    
    
    % Une estimation avec un fenetre rectangulaire
    % equivaut une estimation moyenné
    Xi = X(1:N);
    [Pxx, F] = pwelch(Xi,rectwin(M),0,NFFT,1,'twosided');
    
    %% DPSM theorique et Biais
    [Gth,Gbiais,f] = sptheo(M,'moyenne'); 
    
    %% Affichage
    Pxx_db = 10*log10(Pxx);
    l = length(F);
    
    plot(F(1:l/2),Pxx_db(1:l/2),f,Gth,f,Gbiais);
    axis([0 0.5 -50 10]);
    legend('DPSM estimee','DPSM theorique','Esperance de DPSM estimee');
    titre= sprintf('DSPM theorique et estimée via estimateur moyenné avec %d tranches de %d echantillons, NFFT =%d \n et esperance de DPSM estimee',N/M,M,NFFT);
    title(titre);
    xlabel('f');
    ylabel('dB');

end