function sequence1(M)
    % Les parametres des s(k).
    r = 0.89;
    f0 = 5/21;
    k = 0:(M-1);
    
    % Le nombre des points pour la TFTD 
    N = 1024;
    
    s = (r.^k).*cos(2*pi*f0*k);
    
    figure(1);
    stem(k,s);

    figure(2);
    S =  fft(s,N);
    f = -1:(1/N):(1-1/N);
    Y = 0.5*((1./(1-r*exp(1i*2*pi.*(f0-f))) + (1./(1-r*exp(-1i*2*pi.*(f0+f))))));
    
    v = linspace(0,1,N);
    
     % Affichage des parties réelles
    subplot(2,2,1); hold on; grid on;
    plot(v,real(S),f,real(Y),'--');
    legend('S(n)','Y(f)');
    title('Les parties reelles');
    xlabel('f');
    
     % Affichage des parties imaginaires
    subplot(2,2,2); hold on; grid on;
    plot(v,imag(S),f,imag(Y),'--');
    legend('S(n)','Y(f)');
    title('Les parties imaginaires');
    xlabel('f');
    
     % Affichage des modules
    subplot(2,2,3); hold on; grid on;
    plot(v,abs(S),f,abs(Y),'--');
    legend('S(n)','Y(f)');
    title('Les modules');
    xlabel('f');
    
     % Affichage des phases
    subplot(2,2,4); hold on; grid on;
    plot(v,angle(S),f,angle(Y),'--');
    legend('S(n)','Y(f)');
    title('Les phases');
    xlabel('f');
    
    figure(3);
    
    S=fftshift(S);
    v = linspace(-0.5,0.5,N);
    
     % Affichage des parties réelles
    subplot(2,2,1); hold on; grid on;
    plot(v,real(S),f,real(Y),'--');
    legend('S(n)','Y(f)');
    title('Les parties reelles');
    xlabel('f');
    
     % Affichage des parties imaginaires
    subplot(2,2,2); hold on; grid on;
    plot(v,imag(S),f,imag(Y),'--');
    legend('S(n)','Y(f)');
    title('Les parties imaginaires');
    xlabel('f');
    
     % Affichage des modules
    subplot(2,2,3); hold on; grid on;
    plot(v,abs(S),f,abs(Y),'--');
    legend('S(n)','Y(f)');
    title('Les modules');
    xlabel('f');
    
     % Affichage des phases
    subplot(2,2,4); hold on; grid on;
    plot(v,angle(S),f,angle(Y),'--');
    legend('S(n)','Y(f)');
    title('Les phases');
    xlabel('f');
    
    
    
    
end