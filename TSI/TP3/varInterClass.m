function [s, v] = varInterClass(H)

eT = sum(H);
m = (H/eT)*(1:256)';
v = zeros(1,255);

for s=1:255
    
    HG = H(1:s); eG = sum(HG);  mG = (HG/eG)*(1:s)';
    HD = H(s+1:256); eD = sum(HD); mD = (HD/eD)*(s+1:256)';
    v(s) = (eG/eT)*((mG-m)^2) + (eD/eT)*((mD-m)^2);      
end

plot((1:255),v);
title('La variance interclasse');
xlabel('Le seuil');
ylabel('La variance');
[v, s] = max(v);

end