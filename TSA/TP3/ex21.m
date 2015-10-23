clear all; close all;

Fs   = 500;
B    = 160;
v0   = 100;
Dnu  = 16;
T    = 100; 
ordre= 6;
sigma= sqrt(5);
A = 1;

%% Generation du signal sinusoidal 100Hz
figure(1);

Sp = struct('Fs',Fs,'A',A,'Fc',v0,'FM',0,'Phi',0,'T',100,'W',[]);
[S,Sp,M] = OOK(Sp) ;

%% Passage du signal par un filtre passe-bande
figure(2);
Fp = struct('Fs',Fs,'F0',v0,'Dnu',Dnu,'order',ordre,'class','BP filter');
[Y,Fp] = BPF(S,Fp);

moyY      = mean(Y.data);
varianceY = (std(Y.data))^2;
densite = varianceY/(2*Dnu);

rep21 = sprintf('Rep21:\n La moyenne = %d \n La variance = %d \n Densite = %d',moyY,varianceY,densite);
disp(rep21);