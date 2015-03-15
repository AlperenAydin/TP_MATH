clear all;close all; hold on; grid on;

n_cases=24;
cx=[1:n_cases];
cy=[1:n_cases];
[CX,CY]=meshgrid(cx,cy);

figure(1);
%mesh(CX,CY,zeros(n_cases,n_cases));

M = zeros (n_cases,n_cases);

n_impacts=537;

for i=1:n_impacts

    x=randi(n_cases);
    y=randi(n_cases);
    
    M(x,y)=M(x,y)+1;
    
end

b=bar3(M);
colorbar;

for i = 1:length(b)
     zdata = get(b(i),'Zdata');
     set(b(i),'Cdata',zdata);
     set(b,'EdgeColor','k','FaceColor','interp');

end

figure(2);
n_zones = n_cases*n_cases;


M=M(:); % il mets les 24X24 par une ligne
m = max(M);
absM = [0:m];
m1 = hist(M,absM);
bar(absM,m1/n_zones);
xlabel('Le nombre d impacts');
ylabel('Le nombre de zones ayant eu ce nombre d impact');

