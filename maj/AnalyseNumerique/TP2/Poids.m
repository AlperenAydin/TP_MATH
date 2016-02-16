function W = Poids(X,n)
%Chercher W revient a resoudre l'equation suivant A*W = B

% Calcul de A et B
A = ones(n);
B = ones(n,1);
for i = 1:n
    A(i,:) =  X.^(i-1);
    B(i) = (X(end)^i -X(1)^i)/i;
end

W =A\B;

end