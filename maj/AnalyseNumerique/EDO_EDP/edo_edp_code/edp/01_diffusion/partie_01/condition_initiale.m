function f0 = condition_initiale(x)
% 
% x : vecteur d'échantillons
%

N = length(x);
f0 = zeros(N,1);

a = 0.4;
b = 0.6;

for k = [1:N]
    if( x(k)>=a && x(k)<=b )
        f0(k) = 1;
    end
end

