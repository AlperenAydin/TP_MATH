
function [s]=PB(z,Fe,Fc)
 
 Lt=4/Fc;
 M=fix(2*Fe*Lt)+1;
 IR=fir1(M-1,2*Fc/Fe,hamming(M),'noscale');
 s=conv(z,IR');
 
 
 
 
 
 
 
