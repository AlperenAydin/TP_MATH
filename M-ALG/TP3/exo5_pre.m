clear all; close all;

hold on;

% trace le cercle d'equation x^2 + y^2 -1 = 0

ezplot('x.^2 + y.^2 -1',[-2,2],[-2,2]);

% trace l'ellipse d'equation ax^2 + by^2 -c =0

a=2; b= 8; c= 5;
stra = num2str(a);strb = num2str(b);strc = num2str(c);
s = [stra, '*x.^2+',strb,'*y.^2-',strc ];
ezplot(s,[-2,2],[-2,2]);
axis equal;