clear alll;close all;
X= [0:1.3:10];

set(gcf,'numbertitle','off','name','Annexe 1 ')

t  = 0:0.1:10;
A  = [1,2];
w  = [pi,2*pi];
fi = [pi/2, pi/4];

n  = length(A);

for i =1:n
   subplot(2,n,i);
   
   y = A(i).*sin(w(i).*t + fi(i)); 
   plot(y);
   xlabel('indice matriciel');
   ylabel('y');
   str = sprintf('A=%.2f, w =%.2f, fi = %.2f', A(i),w(i), fi(i));
   title(str);
   
   subplot(2,n,n+i);
   str= strcat(str,' signal y en fonction du temps')
   plot(t,y);
   title(str);
   xlabel('t');
   ylabel('y');
end