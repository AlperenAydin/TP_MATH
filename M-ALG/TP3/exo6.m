clear all; close all; hold on ; 

n = 200;
y=rand(1,n);
x= y+ 2*rand(1,n);
X = x- mean(x);
Y = y- mean(y);


figure(1);
scatter (X,Y,20, 'filled');


%%Optimisation de projection:
theta = [0 :0.01:pi];
l     = length (theta);
S     = zeros(1,l);

for i =1:l
    for k =1:n
        S(i) = S(i)+(X(k)*cos(theta(i)) +Y(k)*sin(theta(i)))^2; 
        %La somme de projections orthogonaux de tout les point sur le
        %droite
    end
end

theta_max = theta (find( S==max(S)));% La theta qui maximise la somme
theta_min = theta (find( S==min(S)));% La theta qui minimise la somme

abs= [-1.5:0.01:1.5];

courbe_dir_max = zeros(2,length(abs));% La direction principale
courbe_dir_max(1,:) = abs*cos(theta_max);
courbe_dir_max(2,:) = abs*sin(theta_max);

plot(courbe_dir_max(1,:),courbe_dir_max(2,:));


courbe_dir_min = zeros(2,length(abs));% Le directon principale 
                                      %   dephasee de pi/2
courbe_dir_min(1,:) = abs*cos(theta_min);
courbe_dir_min(2,:) = abs*sin(theta_min);

plot(courbe_dir_min(1,:),courbe_dir_min(2,:));

%%Diagonlisation
figure(2)

hold on;

scatter (X,Y,20, 'filled');

N = [X;Y];

G = N*N';

[V,D] = eig(G);
d = diag(D);

quiver(0,0,V(1,1),V(2,1));
quiver(0,0,V(1,2),V(2,2));

theta_m = atan2(V(2,2),V(1,2));
mod(theta_m+pi,2*pi);
theta_max;

figure(3);
hold on;

scatter (X,Y,20, 'filled');

plot(courbe_dir_max(1,:),courbe_dir_max(2,:));
plot(courbe_dir_min(1,:),courbe_dir_min(2,:));

quiver(0,0,V(1,1),V(2,1));
quiver(0,0,V(1,2),V(2,2));



% Ellipses :
figure(4); hold on;

scatter (X,Y,20, 'filled');
theta = [0:0.05:2*pi];

alpha = [0.05:0.05:0.25];

for a = alpha 
    A = a*diag(1)^0.5;
    B = a*diag(2)^0.5;
    x = A*cos(theta);
    y = B*sin(theta);
    plot(x,y,'r');
    ellipse = [x;y]'*V;
    plot(ellipse(:,1),ellipse(:,2));
end



