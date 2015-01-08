function main()
clear all; close all;

tmin = -5; tmax = 5;
Te = 0.01;
ve = 1/Te;
v1 = 20; v2 = 45;

v_bruit = [v1,v2];

t = [tmin:Te:tmax];

f0 = signal(t);
f1 = bruit(t, v1, v2);

f= f0 +f1;


line = 2;
col  = 2; 

subplot(line,col,1);
plot(t,f);

TF_f = fftshift(fft(f));
v = linspace(-ve/2, ve/2, length(TF_f));

subplot(line,col,2);
plot(v,abs(TF_f));

n=length(v_bruit);
for i = 1:n
   indice = find( abs(v)< v_bruit(i)+5 & abs(v) > v_bruit(i) -5) ;
   
   avant = TF_f (indice(1) -1);
   apres = TF_f (indice(end) +1);
   
   moy = (avant+ apres)/2;
   
   TF_f (indice)= moy;
   
   
end


subplot(line, col, 3);
plot(v,abs(TF_f));

fr = ifft(fftshift(TF_f));
 
subplot(line,col, 4);
plot(t,-real(fr));
grid on;

end



function y = signal(t)
    %y = exp(-5*pi*(t.^2));
    y = exp(-1*(t .^2));
    %y = (abs(t) <1).*(1- abs(t));
    %y =sin(t);
end


function y = bruit(t,v1,v2)
    y = 0.05*sin(2*pi*v1*t) + 0.02*sin(2*pi*v2*t);
end
