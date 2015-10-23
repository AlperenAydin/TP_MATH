clear all; close all;

Fs   = 500;
B    = 160;
v0   = 100;
Dnu  = 16;
T    = 100; 
ordre= 6;
sigma= sqrt(5);

%% Exercice 1.1:
figure(1);
Xp = struct('sigma',sigma,'Fs',Fs,'B',B,'T',T) ;
[X,Xp] = CGN(Xp);

moyX = mean(X.data);
varianceX = (std(X.data))^2;
sig0 = varianceX/(2*B);

rep11 = sprintf('Rep1.1:\n La moyenne = %d \n La variance = %d \n sig0 = %d',moyX,varianceX,sig0);
disp(rep11);
%% Exercice 1.2:
figure(2);
Fp = struct('Fs',Fs,'F0',v0,'Dnu',Dnu,'order',ordre,'class','BP filter');
[Y,Fp ] = BPF(X,Fp);

moyY      = mean(Y.data);
varianceY = (std(Y.data))^2;
densite = varianceY/(2*Dnu);

rep11 = sprintf('Rep1.2:\n La moyenne = %d \n La variance = %d \n Densite = %d',moyY,varianceY,densite);
disp(rep11);

%% Exercice 1.3:
[Z] = SquareSig(Y);
prod = [2,20,100];

for i=1:length(prod)
   figure(2+i);
   RC = prod(i)/Dnu; 
   RCFp = struct('Fs',Fs,'RC',RC);
   [W,RCFp] = RCF (Z,RCFp);
   
   W_c = W.data( find(W.time > 5*RC) );
   
   moyW      = mean(W_c);
   varianceW = (std(W_c))^2;
   kurt      = kurtosis(W_c);
   rep13 = sprintf('Rep1.3: \n Dnu x RC = %d, \n RC = %d \n La moyenne = %d \n La variance = %d \n Kurtosis = %d',prod(i),RC,moyW,varianceW,kurt);
   disp(rep13);
end

%% Exercice 2.1:

