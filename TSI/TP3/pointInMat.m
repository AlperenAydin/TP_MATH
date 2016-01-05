function [r] = pointInMat(x,y,M)
[H, W] = size(M);
r= false;
if( 0 < x && 0<y && x<H && y<W)
    r = true;
end
    
    

end