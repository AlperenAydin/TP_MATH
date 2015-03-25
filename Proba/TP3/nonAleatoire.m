% Dans cette cas, un certaines nombre d'impacts sont choisi
% aleatoirement sur tout les cases.
% La reste sont choisit sur une portition des cases.

clear all;close all; hold on; grid on;

n_cases=24;
cx=[1:n_cases];
cy=[1:n_cases];
[CX,CY]=meshgrid(cx,cy);

figure(1);
M = zeros (n_cases,n_cases);

n_impacts=537;
n_impacts_rand = 250;

for i=1:n_impacts_rand

    x=randi(n_cases);
    y=randi(n_cases);
    
    M(x,y)=M(x,y)+1;
end

% La portion cible est une carre au centre de hauteur 5
aire_cible = 5;
for i=1:(n_impacts-n_impacts_rand)

    x=9+randi(5);
    y=9+randi(5);
    
    M(x,y)=M(x,y)+1;
end


b=bar3(M);
colorbar;

for i = 1:length(b)
      zdata = get(b(i),'Zdata');
      set(b(i),'Cdata',zdata);
      set(b,'EdgeColor','k','FaceColor','interp');
 
end

figure(2);hold on;
n_zones = n_cases*n_cases;

% La Probabilite theorique
M=M(:); % il mets les 24X24 par une ligne
m = max(M);
absM = [0:m];
m1 = hist(M,absM);
bar(absM,m1/n_zones,0.5,'y');
xlabel('Le nombre d impacts');
ylabel('Le nombre de zones ayant eu ce nombre d impact');

% Le probabilite theorique:
% On considere un loi de Poisson
A = sum (M) / length(M); % Le parametre de notre loi de Poisson

Poi = zeros (0,m+1);
for k = 0:m
    Poi(k+1)= A^(k) / factorial(k);   
end
Poi = Poi*exp(-A);

bar(absM,Poi,0.3,'c');
legend('experimental','theorique');