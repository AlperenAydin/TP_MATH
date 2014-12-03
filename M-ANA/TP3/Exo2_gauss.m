function main()
clear all ;
close all;
hold on ;

tmin=-5;
tmax=5;

pas=0.01;
t=[tmin:pas:tmax];
a=1;

f= monSignal(t);

subplot(2,3,1);
plot(t,f);
title('Mon signal');
grid on;

i=complex(0,1);
F=@(nu)(quad(@(t)(exp(-2.*i.*pi.*nu.*t)).*monSignal(t),-5,5,1e-5));
Y=[];
for nu=t
    Y=[Y,F(nu)];
end

subplot(2,3,2);
plot(t,[real(Y)]);
grid on;
title('Partie real');

subplot(2,3,3);
plot(t,imag(Y));
grid on;
title('Partie imaginaire');

subplot(2,3,4);
plot(t,abs(Y));
grid on;
title('Abs');

subplot(2,3,5);
plot(t,abs(angle(Y)));
grid on;
title('Phase');

subplot(2,3,6);
plot(t,(sinc(t)).^2);

end

function y=monSignal(t)
y=exp(-pi*(t.^2));
end