function estimateurSpecSimple(x, nd, nf, NFFT)
   
    xi = x(nd:nf);
    %% Calcul de l'estimation de DSPM via l'estimateur simple
    % voir figure 1, page 27 
    % de TSA Chapitre III: ESTIMATION des   moments d’un signal aléatoire 
    
    Xi = fft(xi,NFFT);
    sig1 = (1/(nf-nd))*(abs(Xi)).^2;    
    sig1_db = 10*log10(sig1); % DPSM en db
    df = 1/NFFT;
    f_est = 0:df:1-df;
    
    %% DPSM theorique et Biais
    [Gth,Gbiais,f] = sptheo(nf-nd,'simple'); 
    
    plot(f_est(1:NFFT/2),sig1_db(1:NFFT/2),f,Gth,f,Gbiais);
    legend('DPSM estimee','DPSM theorique','Esperance de DPSM estimee');
    titre= sprintf('DSPM theorique et estimée via estimateur simple avec nd=%d, nf= %d, NFFT =%d \n et esperance de DPSM estimee',nd,nf,NFFT);
    title(titre);
    xlabel('f');
    ylabel('dB');
    axis([0 0.5 -50 10]);
end