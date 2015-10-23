function estimateurSpecSimple_modifiee(x, nd, nf, NFFT)
   
    xi = x(nd:nf);
    %% Calcul de l'estimation de DSPM via l'estimateur simple
    % voir figure 1, page 27 
    % de TSA Chapitre III: ESTIMATION des   moments d’un signal aléatoire 
    
    Xi = fft(xi,NFFT);
    sig1 = (1/(nf-nd))*(abs(Xi)).^2;
    df = 1/NFFT;
    f_est = 0:df:1-df;
    
    
    semilogy(sig1(1:NFFT/2),f_est(1:NFFT/2));
    legend('DPSM estimee');
    titre= sprintf('DSPM estimée via estimateur simple avec nd =%d, nf =%d NFFT =%d ',nd,nf,NFFT);
    title(titre);
    xlabel('f');
    ylabel('dB');
end