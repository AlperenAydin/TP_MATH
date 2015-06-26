function affiche_filtre(fil,nue,fig)
    
    figure(fig);
    
    N = 2^10;
    %% Reponse impulsionelle
    subplot(2,2,1);
    plot(fil);grid on;
    title('Reponse impulsionelle');
    xlabel('Indice');

    %% Diagramme pole-zero
    subplot(2,2,2);
    zplane(fil,[]);grid on;
    title('Diagramme pôle-zéros');
    
    %% Le gain complexe  
    [H,F] = freqz(fil,1,N,nue);
    
    %% en module
    subplot(2,2,3),
    plot(F,20*log(abs(H)));grid on;
    title('Le gain complexe en module');
    xlabel('Frequence (Hz)');
    ylabel('Gdb');
    %% Phase
    subplot(2,2,4);
    plot(F,unwrap(angle(H)));grid on;
    title('La phase du gain complexe');
    xlabel('Frequence (Hz)');
end