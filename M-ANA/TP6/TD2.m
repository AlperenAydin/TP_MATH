function main

clear all;close all;hold on;
R=1;

u=[-5:0.1:5];
v=u;
[U,V]=meshgrid(u,v);
W=(R .* besselj(1,2*pi*(amp(U,V)))) ./ amp(U,V);
subplot(1,2,2);
mesh(U,V,W);

TF = abs (real(fftshift(fft2(fenetre(U,V,R)))));
subplot(1,2,1);
mesh(TF);


end


function ro = amp(u,v)
    ro = (u.^2 + v.^2) .^(1/2);
 
end

function y = fenetre (x,y,R) %Fenetre de rayon R
    y = (amp(x,y)<= R);
end
