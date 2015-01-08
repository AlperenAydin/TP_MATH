clear all;
close all;
hold on ;

S =[-1.0472 -1.0372 -1.0272 -1.0172 -1.0072 -0.9972 -0.9872 -0.9772 -0.9672 -0.9572 -0.9472 -0.9372 -0.9272 -0.9172 -0.9072 -0.8972 -0.8872 -0.8772 -0.8672 -0.8572 -0.8472 -0.8372 -0.8272 -0.8172 -0.8072 -0.7972 -0.7872 -0.7772 -0.7672 -0.7572 -0.7472 -0.7372 -0.7272 -0.7172 -0.7072 -0.6972 -0.6872 -0.6772 -0.6672 -0.6572 -0.6472 -0.6372 -0.6272 -0.6172 -0.6072 -0.5972 -0.5872 -0.5772 -0.5672 -0.5572 -0.5472 -0.5372 -0.5272 -0.5172 -0.5072 -0.4972 -0.4872 -0.4772 -0.4672 -0.4572 -0.4472 -0.4372 -0.4272 -0.4172 -0.4072 -0.3972 -0.3872 -0.3772 -0.3672 -0.3572 -0.3472 -0.3372 -0.3272 -0.3172 -0.3072 -0.2972 -0.2872 -0.2772 -0.2672 -0.2572 -0.2472 -0.2372 -0.2272 -0.2172 -0.2072 -0.1972 -0.1872 -0.1772 -0.1672 -0.1572 -0.1472 -0.1372 -0.1272 -0.1172 -0.1072 -0.0972 -0.0872 -0.0772 -0.0672 -0.0572 -0.0472 -0.0372 -0.0272 -0.0172 -0.0072 0.0028 0.0128 0.0228 0.0328 0.0428 0.0528 0.0628 0.0728 0.0828 0.0928 0.1028 0.1128 0.1228 0.1328 0.1428 0.1528 0.1628 0.1728 0.1828 0.1928 0.2028 0.2128 0.2228 0.2328 0.2428 0.2528 0.2628 0.2728 0.2828 0.2928 0.3028 0.3128 0.3228 0.3328 0.3428 0.3528 0.3628 0.3728 0.3828 0.3928 0.4028 0.4128 0.4228 0.4328 0.4428 0.4528 0.4628 0.4728 0.4828 0.4928 0.5028 0.5128 0.5228 0.5328 0.5428 0.5528 0.5628 0.5728 0.5828 0.5928 0.6028 0.6128 0.6228 0.6328 0.6428 0.6528 0.6628 0.6728 0.6828 0.6928 0.7028 0.7128 0.7228 0.7328 0.7428 0.7528 0.7628 0.7728 0.7828 0.7928 0.8028 0.8128 0.8228 0.8328 0.8428 0.8528 0.8628 0.8728 0.8828 0.8928 0.9028 0.9128 0.9228 0.9328 0.9428 0.9528 0.9628 0.9728 0.9828 0.9928 1.0028 1.0128 1.0228 1.0328 1.0428 1.0528 1.0628 1.0728 1.0828 1.0928 1.1028 1.1128 1.1228 1.1328 1.1428 1.1528 1.1628 1.1728 1.1828 1.1928 1.2028 1.2128 1.2228 1.2328 1.2428 1.2528 1.2628 1.2728 1.2828 1.2928 1.3028 1.3128 1.3228 1.3328 1.3428 1.3528 1.3628 1.3728 1.3828 1.3928 1.4028 1.4128 1.4228 1.4328 1.4428 1.4528 1.4628 1.4728 1.4828 1.4928 1.5028 1.5128 1.5228 1.5328 1.5428 1.5528 1.5628 1.5728 1.5828 1.5928 1.6028 1.6128 1.6228 1.6328 1.6428 1.6528 1.6628 1.6728 1.6828 1.6928 1.7028 1.7128 1.7228 1.7328 1.7428 1.7528 1.7628 1.7728 1.7828 1.7928 1.8028 1.8128 1.8228 1.8328 1.8428 1.8528 1.8628 1.8728 1.8828 1.8928 1.9028 1.9128 1.9228 1.9328 1.9428 1.9528 1.9628 1.9728 1.9828 1.9928 2.0028 2.0128 2.0228 2.0328 2.0428 2.0528 2.0628 2.0728 2.0828 2.0928 ;
0.8660 0.8610 0.8559 0.8506 0.8453 0.8400 0.8345 0.8289 0.8233 0.8176 0.8118 0.8059 0.7999 0.7939 0.7878 0.7816 0.7753 0.7690 0.7625 0.7560 0.7494 0.7428 0.7360 0.7292 0.7224 0.7154 0.7084 0.7013 0.6941 0.6869 0.6796 0.6722 0.6648 0.6573 0.6497 0.6421 0.6344 0.6266 0.6188 0.6109 0.6030 0.5949 0.5869 0.5788 0.5706 0.5623 0.5540 0.5457 0.5373 0.5288 0.5203 0.5117 0.5031 0.4944 0.4857 0.4770 0.4682 0.4593 0.4504 0.4414 0.4324 0.4234 0.4143 0.4052 0.3960 0.3868 0.3776 0.3683 0.3590 0.3497 0.3403 0.3308 0.3214 0.3119 0.3024 0.2928 0.2833 0.2737 0.2640 0.2544 0.2447 0.2350 0.2252 0.2155 0.2057 0.1959 0.1861 0.1763 0.1664 0.1566 0.1467 0.1368 0.1269 0.1169 0.1070 0.0970 0.0871 0.0771 0.0671 0.0572 0.0472 0.0372 0.0272 0.0172 0.0072 0.0028 0.0128 0.0228 0.0328 0.0428 0.0528 0.0628 0.0727 0.0827 0.0927 0.1026 0.1126 0.1225 0.1324 0.1423 0.1522 0.1621 0.1719 0.1818 0.1916 0.2014 0.2112 0.2210 0.2307 0.2404 0.2501 0.2598 0.2694 0.2790 0.2886 0.2982 0.3077 0.3172 0.3267 0.3361 0.3455 0.3549 0.3642 0.3735 0.3828 0.3920 0.4012 0.4103 0.4194 0.4285 0.4375 0.4465 0.4554 0.4643 0.4731 0.4819 0.4906 0.4993 0.5079 0.5165 0.5251 0.5336 0.5420 0.5504 0.5587 0.5670 0.5752 0.5833 0.5914 0.5994 0.6074 0.6153 0.6232 0.6310 0.6387 0.6464 0.6540 0.6615 0.6690 0.6764 0.6837 0.6910 0.6981 0.7053 0.7123 0.7193 0.7262 0.7331 0.7398 0.7465 0.7531 0.7597 0.7661 0.7725 0.7788 0.7851 0.7912 0.7973 0.8033 0.8092 0.8150 0.8208 0.8265 0.8321 0.8376 0.8430 0.8483 0.8536 0.8587 0.8638 0.8688 0.8737 0.8785 0.8833 0.8879 0.8925 0.8969 0.9013 0.9056 0.9098 0.9139 0.9179 0.9218 0.9257 0.9294 0.9331 0.9366 0.9401 0.9434 0.9467 0.9499 0.9529 0.9559 0.9588 0.9616 0.9643 0.9669 0.9694 0.9718 0.9741 0.9763 0.9784 0.9805 0.9824 0.9842 0.9859 0.9875 0.9891 0.9905 0.9918 0.9930 0.9942 0.9952 0.9961 0.9970 0.9977 0.9983 0.9988 0.9993 0.9996 0.9998 1.0000 1.0000 0.9999 0.9998 0.9995 0.9991 0.9986 0.9981 0.9974 0.9966 0.9958 0.9948 0.9937 0.9926 0.9913 0.9899 0.9885 0.9869 0.9852 0.9835 0.9816 0.9797 0.9776 0.9755 0.9732 0.9709 0.9684 0.9659 0.9632 0.9605 0.9577 0.9547 0.9517 0.9486 0.9454 0.9421 0.9387 0.9352 0.9316 0.9279 0.9241 0.9203 0.9163 0.9123 0.9081 0.9039 0.8996 0.8952 0.8907 0.8861 0.8814 0.8766 0.8718 0.8668 ];

l=length(S);

t= S(1,:);
f= S(2,:); 

pas= (t(l)-t(1))/l;
T= t(l)-t(1);

nbHarm= 20;
w=2*pi/T;

a0=(trapz(f))*pas/T;

a=zeros(1,nbHarm);
b=zeros(1,nbHarm);

for n=1:nbHarm
    a(1,n)=trapz( f .* cos(n*w*t));
    b(1,n)=trapz( f .* sin(n*w*t));
end

a=a*pas*2;
b=b*pas*2;

a=a./T;
b=b./T;

A= a.^2 + b.^2;
A=sqrt(A);
fr= 1/T;
nu=[1:nbHarm]*fr;

r=zeros(1,l); %Reconstruction


for n=1:nbHarm
    r=r+a(1,n)*cos(w*n*t)+b(1,n)*sin(w*n*t);

end

r=r+a0;

Ef=(pas*trapz(f.^2))/T;
Eper= a0^2 +sum(a.^2+b.^2)/2;
fprintf('Energie efficace: %f.',Eper); 


%Les Codes des Graphiques
figure(1);

subplot(1,2,1);
plot(t,[f;r]);
title('Signal');
xlabel('x');
ylabel('f(t)');
legend('signal d`origine','signal reconstruit ');

subplot(1,2,2);
bar(nu,A,0.2);
title('Spectre:30 harmoniques');
xlabel('fréquence (v_n)');
ylabel('amplitude (A_n)');
