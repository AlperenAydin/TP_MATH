function main()
clear all; close all;

tmin = 0;tmax = pi;
Te = 0.01; ve = 1/Te; vc=2/pi; % vc a verifier

t = [tmin:Te:tmax];
v = linspace(-ve/2, ve/2, length(t));

f = (cos(t)).^2;

Te = [0.1, 0.5, 1, 3];
l =length(Te);
figure (1);

for i=1:l
    
    T = Te(i);
    t = [tmin:T:tmax];    
    f_ech = (cos(t)) .^2;
   
     
    
    subplot(2, l/2, i);
    plot(t,f_ech);
    
end

figure (2);
subplot(1,2,1);
plot(t,f);

subplot(1,2,2);
plot(v, abs(fftshift(fft(f))));

end