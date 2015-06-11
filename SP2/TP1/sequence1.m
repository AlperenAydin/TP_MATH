function [k,s] = sequence1(A,f0,phs,kd,kf)

    k = kd:kf;
    s = A*sin(2*pi*f0*k + phs);

end