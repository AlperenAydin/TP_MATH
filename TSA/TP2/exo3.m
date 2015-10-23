clear all; close all;

load('sig.mat');


% N = 1000;
% nd = 1;
% nf = nd+N;
% 
% NFFT = 2^(nextpow2(nf-nd)+3);
% estimateurSpecSimple_modifiee(s, nd, nf, NFFT);

N = 50000;
M = 1000;
NFFT = 2^(nextpow2(M));
estimateurSpectMoyenne_modifiee(s, N, M, NFFT)

% N = 50000;
% Nom_fenetre = 'bartlett';
% M = 100;
% NOVERLAP = (50/100)*M;
% NFFT = 2^(nextpow2(M));
% estimateurSpectWelch(bn, N, Nom_fenetre, M, NOVERLAP, NFFT)