% appel de la fonction Quotient
function main()
clear all;
close all;
disp('Calcul du quotient de deux nombres');
x=input('Entrer a: ');
y=input('Entrer b: ');
z=Quotient(x,y);
fprintf('Le résultat est %f.',z);

% fonction calculant le quotient de deux nombre
function c=Quotient(a,b)
if b~=0
c=a/b;
else
error('division par zero');
end