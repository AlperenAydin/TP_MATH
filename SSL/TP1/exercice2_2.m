close all;clear all;hold on ;

min =0;max =10; 
pas= 0.01;

t = (min:pas:max) ;
n = length (t);

s = zeros(1,n);

diracs = [1 5 8]; % Les positions des diracs
l =length(diracs);
%On cherche dans t les temps qui corresponds aux diracs

indice_diracs = find(t == diracs(1));
for i =2:l
    i;
    indice_diracs = [indice_diracs  find( t  == diracs(i))];

end

%on met nos pics
s(indice_diracs) = 1;

stem(t,s);
title('Pics diracs');
xlabel('t');
ylabel('y');

