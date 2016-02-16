function l = longueurCourbe(M)
l = 0;
N = length(M);
for i = 1:N-1
    P1 = M(:,i);
    P2 = M(:,i+1);
    l = l+ norm(P1-P2);
end
end