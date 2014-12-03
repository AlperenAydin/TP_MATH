close all;clear all;hold on;

min = 0; max = 10;
pas= 0.01;
t =(min:pas:max-pas);
n= length(t)

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

subplot(3,1,1)
stem(t,s);
title('Pics diracs');
xlabel('t');
ylabel('y');


min = 0; max = 1;
pas= 0.01;
t =(min:pas:max-pas);

Z = sin(2*pi*t);


subplot(3,1,2);
plot(t, Z);
grid on;
legend('Z','s');
title('Les sinus entre 0 et 1');
xlabel('t');
ylabel('Z')

C = conv(Z,s);
cl = length(C);
tau = linspace(0,10, cl)
subplot(3,1,3);
plot(tau,C);
grid on;
title('La convolution');
xlabel('\tau')
ylabel('C');