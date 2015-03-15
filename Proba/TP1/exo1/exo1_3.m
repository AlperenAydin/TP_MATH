clear all; close all; hold on;

vals = 10:10:80; l = length(vals);
theorie = zeros (1,l);
empirique = zeros (1,l);

for i = 1:l
    valeur = vals(i);
    theorie(i) = theorique(valeur);
    empirique(i) = empirique (valeur); 
end


plot (vals, [theorie;empirique]);
legend ('- theorie','- empirique');
grid on;
xlabel('Nombre de gens');
ylabel('Probabilite');
