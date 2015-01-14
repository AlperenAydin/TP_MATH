function courbeBezier(X,Y)

i=complex(0,1);t=0:0.01:1;s=1-t;


P=X+i*Y;

for k=1:length(X)-1;
    
    Pt(k)=(2*P(k)+P(k+1))/3; %Premier Tiers
    Dt(k)=(P(k)+2*P(k+1))/3; %Deuxième Tiers
    
end;

for k=1:length(X)-2;
    
    Mi(k)=(Dt(k)+Pt(k+1))/2;%Milieu

end;

for k=1:length(X)-3;
    
    A=Mi(k);B=Pt(k+1);C=Dt(k+1);D=Mi(k+1);%Liste de n=length(t) points courants de Béz(A,B,C,D):
    M=s.^3*A+3*s.^2.*t*B+3*s.*t.^2*C+t.^3*D;
    plot(M,'LineWidth',3,'color',rand(1,3));
    hold on
end;

endfunction