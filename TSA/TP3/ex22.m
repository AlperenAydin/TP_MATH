clear all; close all;

Fs   = 500;
B    = 160;
v0   = 100;
Dnu  = 16;
T    = 100; 
ordre= 6;
sigma= sqrt(5);
A = 1;


%% Generation de S(t):
figure(1);

Sp = struct('Fs',Fs,'A',A,'Fc',v0,'FM',0,'Phi',0,'T',100,'W',[]);
[S,Sp,M] = OOK(Sp) ;

%% Generation du bruit:
figure(2);
Xp = struct('sigma',sigma,'Fs',Fs,'B',B,'T',T) ;
[B,Xp] = CGN(Xp);

%% Addition des signaux:
[X] = AddSig(S,B);

%% Filtrage bande-passante
figure(3);
Fp = struct('Fs',Fs,'F0',v0,'Dnu',Dnu,'order',ordre,'class','BP filter');
[Y,Fp] = BPF(X,Fp);

%% Quadrateur + filtrage passe-bas
[Z] = SquareSig(Y);
prod = [2,20,100];

for i=1:length(prod)
   figure(3+i);
   RC = prod(i)/Dnu; 
   RCFp = struct('Fs',Fs,'RC',RC);
   [W,RCFp] = RCF (Z,RCFp);
   
   W_c = W.data( find(W.time > 5*RC) );
   
   moyW = mean(W_c);
   B_s = std(W_c);
   rep  = sprintf('Rep: \n RC x Dnu = %d \n RC = %d \n Moyenne W_S+B = %d \n B_s = %d',prod(i),RC, moyW, B_s);
   disp(rep);
end