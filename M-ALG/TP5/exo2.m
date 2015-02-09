d= 30;

for i=1:d
   for j= 1:d
       
       A(i,j)=d*(i-1)+j;
   end;
end;

M =zeros(d);

for i=1:d-1
   for j=1:d
       
       m =A(i,j);n = A(i+1,j);
       M(m,n) = 1; M(n,m) = 1;   
       
       B = A';
       m = B(i,j);n = B(i+1,j);
       M(m,n) = 1; M(n,m) = 1;   
   end
end

n=d;

[V,D] = eig(M/4);

p = max(abs(diag(D)));

% Condition aux frontieres
nord  = 15; sud =5; 
ouest = 10 ; est = 5;

B =zeros (n*n,1);

B(1:n) = nord; 
B(n*(n-1):n*n) = sud;

B(1:n:n*n) =B(1:n:n*n) + ouest; 
B(n:n:n*n) =B(n:n:n*n) + est;  

B = B /4;

T = rand(n*n,1);
for i = 1:10
    T = (M/4)*T +B;
end

TXY = reshape(T, [n,n]);
TXY = TXY';
[X,Y] = meshgrid(1:n);
surf(X,Y,TXY);
shading interp;

