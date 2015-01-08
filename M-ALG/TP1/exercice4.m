close all;
clear all;

n =50;
A = diag((-2)*ones(1,n)); %Le diagonale principale 
A = A + diag(ones(1,n-1),1); % Le diagonale au dessus de -2
A = A +diag(ones(1,n-1),-1);% Le diagonale au dessous de -2

[P,D] =eig(A);
l =length(P);
for i =1:5
    subplot(2,3,i);
    plot(P(:,l-5+i));
    str =fprintf('%d ',l-5+i);
    title(str);
end