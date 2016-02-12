function [x, y] = squareParametrique(t)
     l = length(t);
     l = 4*round(l/4);
     
     x(1:l/4) = 1;
     y(1:l/4) = linspace(-1,1,l/4);
     
     x(l/4 + 1: l/2) = linspace(1,-1,l/4); 
     y(l/4 + 1: l/2) = 1;
     
     x(l/2 + 1: (3*l/4)) = -1; 
     y(l/2 + 1: (3*l/4)) = linspace(1,-1,l/4);
     
     x(3*l/4 + 1: l) = linspace(-1,1,l/4);
     y(3*l/4 + 1: l) = -1;     


end