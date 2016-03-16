function M = matriceInt(dx ,dt, l)

r = dt/(dx^2);

%% Diagonale centrale
i = 1:l;
j = 1:l;
s = (1+2*r)*ones(1,l);

%% Diagonales inferieur et superieur
i = [i, 1:l-1];
j = [j, 2:l];
s = [s, -r*ones(1,l-1) ];

i = [i, 2:l];
j = [j, 1:l-1];
s = [s, -r*ones(1,l-1) ];

M = sparse(i,j,s,l,l);

end
