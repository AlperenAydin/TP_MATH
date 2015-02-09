clear all; close all; hold on; 
a =  3; axis([-a,a,-a,a]);
axis equal; axis tight;

%X =[-1;1;1;0]; Y = [-1,-1,0,1];
[X,Y] = getpts();

n =length(X)+1;
%X(n)=X(1);Y(n)=Y(1);

i =complex(0,1);
B =X' +i*Y';

B(n)=B(1); % cf page 44 du cours
t = 0:0.01:1;   s= 1-t;

b0=s.^2; b1=2*s.*t; b2=t.^2; % Polynome de bernstein de degre 2
for e=0:20;
    plot(B,'-o','linesmoothing','on'); %armature (optionelle)
    
    for k =1:n-1;
        A(k)=(B(k)+B(k+1))/2; % A(k) est le milieu du segment [B(k);B(k+1)]
    end
        A(n)=A(1);
    for k =1:n-1;
        M=A(k)*b0 + B(k+1)*b1 + A(k+1)*b2;% arc allant de A(k) à A(k+1)
        plot(M,'--','linesmoothing','on');% trace les courbes de Bézier
        V(k)= 2*B(k) - A(k) -A(k+1);
    end
    V(n) = V(1);
    V= V./abs(V);
    pause(0.1);
    B =B + 0.1*V;
end