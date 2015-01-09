clear all; close all;


a ='aaa.wav';
figure(1);
[y_aaa, spectre_a,Fe_a]=analyse(a,100000);

ch ='chhhhh.wav';
figure(2);
[y_ch,spectre_ch,Fe_ch]=analyse(ch,100000);
