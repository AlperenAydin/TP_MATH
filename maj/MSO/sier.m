function sier(n,p,r)

Tr = exp(2*[0,1,2]*1i*pi/3);
if(n==0)
    tr = p+r*Tr;
    f  = fill(real(tr),imag(tr),'b');
    set(f,'edgecolor','none');
else
    r = r/2;
    for k=1:3
        sier(n-1, p+r*Tr(k),r);
    end
end


end