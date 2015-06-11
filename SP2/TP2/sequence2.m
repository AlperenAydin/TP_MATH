function sequence2(f0,fi,N)

    k = 0:32;
    s = cos(2*pi*f0*k + fi*pi/180);
    
    figure(1);grid on;
    stem(k,s);
    title('Le signal s(k)');
    xlabel('k');

    figure(2);
    
    S = fft(s,N);
    f = 0:(1/N):(1-1/N);
    
    subplot(2,2,1); 
    stem(f,real(S));grid on;
    title(['La partie reelle de S(n) avec f0=', num2str(f0,2) ,' N=',num2str(N),' \phi =',num2str(fi),'°']);
    xlabel('f');
    
    subplot(2,2,2); 
    stem(f,imag(S));grid on;
    title(['La partie imaginaire de S(n) avec f0=', num2str(f0,2) ,' N=',num2str(N),' \phi =',num2str(fi),'°']);
    xlabel('f');
    
    subplot(2,2,3); 
    stem(f,abs(S));grid on;
    title(['Le module de S(n) avec f0=', num2str(f0,2) ,' N=',num2str(N),' \phi =',num2str(fi),'°']);
    xlabel('f');
    
    subplot(2,2,4); 
    stem(f,angle(S));grid on;
    title(['La phase de S(n) avec f0=', num2str(f0,2) ,' N=',num2str(N),' \phi =',num2str(fi),'°']);
    xlabel('f');
    
    
end