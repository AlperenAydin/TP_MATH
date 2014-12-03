close all;
clear all;

tr1 = [0,0.5,0.5,5,5,9,7,9,7,6 ,2,3,1,0 ;
       0,0  ,2  ,1,2,4,6,8,8,10,5,12,10,12];
tr2 = [-tr1(1,:) ; tr1(2,:)];
tr2 = fliplr(tr2);
tr=[tr1 , tr2];
fill(tr(1,:),tr(2,:),'b');
n = length(tr);


for i = 1:500;
    min = -100;
    max = 100;
    a = (max-min)*rand() + min;
    b = (max-min)*rand() + min;
    
    alpha = (max-min)*rand() + min;

    rotation = [cos(alpha),-sin(alpha) ; sin(alpha),cos(alpha)];
    translation = [a,b]' * ones(1,n);
    Tr = rotation *tr +translation;
    hold on;
    
    r_min = 0.2;
    r_max= 0.7;
    r = (r_max-r_min)*rand() + r_min;
    
    g_min = 0;
    g_max= 0.4;
    g = (g_max-g_min)*rand() + g_min;
    fill(Tr(1,:),Tr(2,:),[r,g,0]); 
    grid on;
end