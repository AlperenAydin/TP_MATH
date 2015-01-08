A = 10 ; phi_0 = 90;
ve = [1000, 300, 150, 60];
v0 = 100; 
T = 1;
N =1000;

l=length(ve);

for i=1:l
    [k,s,M]=signal_test(A,phi_0,T,ve(i),v0);
    
    subplot(l,2,1+2*(i-1));
    plot(k/ve(i), s);
    str  = sprintf('Signal pour une frequence d echantillonage v_e = %d Hz: ',ve(i));
    title(str);
    xlabel('t=kT_e');
    ylabel('s(t)');

    subplot(l,2,2*i);
    freq=linspace(0, ve(i), N);
    plot(freq, abs(fft(s,N)));
    str  = sprintf('Module de la TFD du signal avec v_e = %d Hz: ',ve(i));
    title(str);
    xlabel('Frequences (Hz)');
    ylabel('S(v)');

end