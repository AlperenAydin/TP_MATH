function y = loi_normale (u, o, x)

    y=-((x-u).^2)/(2*o.^2);
    y=exp(y)/(o*sqrt(2*pi));

end