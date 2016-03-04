close all; clear all; clc;

%% Complexité de tri 
N = 1e4;
ta = rand(1,N);
t = zeros(1,N);


for k = 1:N
    tb = ta(1:k);
    tic;
    sort(tb);
    t(k) = toc;
end

figure();
plot(t);
title('Complexité du sort/tri');
xlabel('n');
ylabel('Temps (s)');

%% Complexité de fft 
N = 1e4;
ta = rand(1,N);
t = zeros(1,N);


for k = 1:N
    tb = ta(1:k);
    tic;
    fft(tb);
    t(k) = toc;
end

figure();
plot(t);
title('Complexité du fft');
xlabel('n');
ylabel('Temps (s)');

%% Complexité de inv

N = 1e3;
Ma = rand(N,N);
t = zeros(1,N);
for n = 1:N
   Mb = Ma(1:n,1:n);
   tic;
   inv(Mb);
   t(n) = toc;
end
figure();
plot(t);
title('Complexité d''inv');
xlabel('n');
ylabel('Temps (s)');


%% Complexité de triangulation de gauss

N = 1e2;
Ma = rand(N,N);
t = zeros(1,N);
for n = 1:N
    Mb = Ma(1:n,1:n);
    tic;
    r = 0;
    for j = 1:n
       m = max(Mb(r+1:n, j)); 
       [k, ~] = find(Mb == m);
       if m ~= 0
           r = r+1;
           Mb(k,:) = Mb(k,:) / m;
           V = Mb(k,:);
           Mb(k,:) = Mb(r,:);
           Mb(r,:) = V;
           for i =1:n
               if i ~= r
                   Mb(i,:) = Mb(i,:) - m*Mb(r,:);
               end
           end
       end
        
    end
    t(n) = toc;
end

figure();
plot(1:N,t);
title('Complexité de triangulation de gauss');
xlabel('n');
ylabel('Temps (s)');




