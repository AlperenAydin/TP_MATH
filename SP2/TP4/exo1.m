function [x,h,yc] = exo1(N,fig)
    
    kx = 0:9;
    x = (0<=kx).*(kx<=5).*(abs(kx-3) -1) + (6<=kx).*(kx<=9).*(8-kx) ;
    kh = 0:12;
    h = (3<=kh).*(kh<=12).*(4-abs(kh-7));
    
    X = fft(x,N);
    H = fft(h,N);
    
    yc = ifft(X.*H);
    
    figure(fig);
    
    subplot(3,1,1);
    stem(kx,x); grid on;
    title('sequence x');
    xlabel('k');
    ylabel('x');
    
    subplot(3,1,2);
    stem(kh,h); grid on;
    title('sequence h');
    xlabel('k');
    ylabel('h');
    
    subplot(3,1,3);
    ky = 0:N-1;
    stem(ky,yc); grid on;
    title( ['sequence yc avec N=',num2str(N)]);
    xlabel('k');
    ylabel('yc');
    
end
