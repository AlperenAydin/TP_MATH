clear all; close all; hold on; axis equal; axis off;

n = 8;
for i =1:n
    subplot(2,n/2,i);hold on;
    tic;
    sier(i,0,1);
    t(i) = toc;
    title(['Sierpinsky de profondeur ',num2str(i),' la durée est ',num2str(t(i))]);
end



figure();
plot(t);