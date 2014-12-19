close all;clear all;

a = [-2:0.25:1 ];
n = length(a);

Valeurs_propres= zeros (3,n); 

for i=1:n
    
   Ma = [2 -1 2*a(i)
         -1 2 -1
         2*a(i) -1 2];
     
     [P,D] =eig(Ma);
     Valeurs_propres(:,i) = diag(D);
end

plot (a,Valeurs_propres);grid on;
xlabel('a');
ylabel('Valeurs propres');