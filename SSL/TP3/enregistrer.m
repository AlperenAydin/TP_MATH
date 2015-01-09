clear all;
close all;
clc;

T=10;  % Durée d'enregistrement.
Fe=48000;
bits=16;
Canaux=1;

% Cree objet audiorecorder.
Obj_Rec=audiorecorder(Fe,bits,Canaux);

disp('Parlez !!!')
recordblocking(Obj_Rec, T); % Enregistre durant un temps T.
disp('STOP !!!');

% Joue l'enregistrement.
play(Obj_Rec);
disp('appuyer sur la barre d''espace une fois l''écoute terminée')
pause;
Signal=getaudiodata(Obj_Rec);

N=length(Signal);
t=(0:N-1)/Fe;
figure(1);
plot(t,Signal);

sauve=input('Sauvegarde dans un fichier ? oui=1 non=0 : ');
if sauve==1
    nomfic=input('Nom du fichier (entre cotes):  ');
    nomfic=[nomfic,'.wav'];
    audiowrite(nomfic,Signal,Fe);
end
