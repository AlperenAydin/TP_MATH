function show_fft (s, N, ve,fig)
    S = fft (s,N); % Nous donne le spectre sur [0,ve]
    
    figure  (fig);
    
    subplot (2,2,1)  ;
    plot    (real(S));
    title   ('La partie reelle:');
    xlabel  ('indices matriciels:');
    
    subplot (2,2,2)  ;
    plot    (imag(S));
    title   ('La partie imagiaire:');
    xlabel  ('indices matriciels:');

    subplot (2,2,3)  ;
    plot    (abs(S)) ;
    title   ('La module:');
    xlabel  ('indices matriciels:');
    
    subplot (2,2,4)   ;
    plot    (angle(S));
    title   ('Angle:');
    xlabel  ('indices matriciels:');
    
    v_reduit = [0:ve/N:(ve-ve/N)]/ve;
    size(v_reduit)
    
    figure  (fig+1);
    
    subplot (2,2,1)  ;
    plot    (v_reduit,real(S));
    title   ('La partie reelle du spectre sur [0;v_e]:');
    xlabel  ('Frequence reduite:');
    
    subplot (2,2,2)  ;
    plot    (v_reduit,imag(S));
    title   ('La partie imaginaire du spectre sur [0;v_e]:');
    xlabel  ('Frequence reduite:');

    subplot (2,2,3)  ;
    plot    (v_reduit,abs(S)) ;
    title   ('Le Module du spectre sur [0;v_e]:');
    xlabel  ('Frequence reduite:');
    
    subplot (2,2,4)   ;
    plot    (v_reduit,angle(S));
    title   ('Angle du spectre sur [0;v_e ]:');
    xlabel  ('Frequence Reduite:');
    
    v = [0:ve/N:(ve/2-ve/N)];
    size(v_reduit)
    
    figure  (fig+2);
    
    subplot (2,2,1)  ;
    plot    (v,real(S(1:N/2)));
    title   ('La partie reelle du spectre sur [0;v_e /2]:');
    xlabel  ('Frequence (Hz):');
    
    subplot (2,2,2)  ;
    plot    (v,imag(S(1:N/2)));
    title   ('La partie imaginaire du spectre sur [0;v_e /2]:');
    xlabel  ('Frequence (Hz):');

    subplot (2,2,3)  ;
    plot    (v,abs(S(1:N/2))) ;
    title   ('Le Module du spectre sur [0;v_e /2]:');
    xlabel  ('Frequence (Hz):');
    
    subplot (2,2,4)   ;
    plot    (v,angle(S(1:N/2)));
    title   ('Angle du spectre sur [0;v_e /2]:');
    xlabel  ('Frequence (Hz):');
    
    
end