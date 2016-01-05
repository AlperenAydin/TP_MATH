function [IM2] = imdilategeo(IM,SE,I)

    IM1 = imdilate(IM,SE);
    IM2 = I .* IM1;

end