close all; clear all; clc; pause on;

A = im2double(rgb2gray(imread('img/cellules.jpg')));
A = imnoise(A,'gaussian',0,0.001);
[H, W] = size(A);

Hi = [-1.0 0.0 1.0
    -2.0 0.0 2.0
    -1.0 0.0 1.0];

Hj = Hi';


Gj = imfilter(A,Hi);
Gi = imfilter(A,Hj);
G = sqrt(Gi.^2 + Gj.^2);

figure(1);

subplot(2,2,1);
imagesc(A),colormap gray
title('Image original');

subplot(2,2,2);
imagesc(abs(Gi)),colormap gray;
title('Le gradient horizontal');

subplot(2,2,3);
imagesc(abs(Gj)),colormap gray;
title('Le gradient vertical');

subplot(2,2,4);
imagesc(G),colormap gray;
title('Le gradient');

%% Recherche des contours
Gi_n = Gi ./ G;
Gj_n = Gj ./ G;

ind=find(G==0);
Gi_n(ind)=0;
Gj_n(ind)=0;


d = 2;
epsilon = 0.05;

for s = 0.2:0.01:0.6;
    C = zeros(H,W);
    for i=1:H
        for j=1:W
            Gm = G(i,j);
            
            if Gm>s
                i1 = round(i + d * Gi_n(i,j));
                j1 = round(j + d * Gj_n(i,j));
                Gm1 = 0;
                if (pointInMat(i1,j1,G))
                    Gm1 = G(i1,j1);
                end
                if( Gm-Gm1 > epsilon)
                    i2 = round(i - d * Gi_n(i,j));
                    j2 = round(j - d * Gj_n(i,j));
                    Gm2 = 0;
                    if (pointInMat(i2,j2,G))
                        Gm2 = G(i2,j2);
                    end
                    if(Gm-Gm2 > epsilon)
                        C(i,j) = Gm;
                    end
                end
            end
        end
    end
    
    figure(2);
    subplot(1,2,1);
    imshow(C);
    title(['Recherche des contours avec s=',num2str(s)]);
    
    r = 2;
    se = strel('disk',r);
    CD = imdilate(C,se);
    
    subplot(1,2,2);
    imshow(CD);
    title('Image dilate');
    pause(1);
end