close all; clear all; hold on

M = [1,1,1,0,0,0,0,0,0,0 %a1
     0,0,0,1,1,1,1,0,0,0 %a2
     0,0,0,0,0,0,0,1,1,1 %a3
     1,0,0,1,0,0,0,0,0,0 %a4
     0,1,0,0,1,0,0,1,0,0 %a5
     0,0,1,0,0,1,0,0,1,0 %a6
     0,0,0,0,0,0,1,0,0,1 %a7
     0,0,0,1,0,0,0,1,0,0 %a8
     1,0,0,0,1,0,0,0,1,0 %a9
     0,1,0,0,0,1,0,0,0,1 %a10
     0,0,1,0,0,0,1,0,0,0 %a11
     ];

 
 N =[3 4 3 2 3 3 2 2 3 3 2]';
 
 Xk = ones(10,1);
 size(Xk)
 X =M\N;
 
 Nk=M*Xk
 
 
 
 
 N = [6 22 27 5 15 18 17 12 15 18 10]';
 X = M\N
 
 for i = 1:10
    Xk(i) = i; 
 end
 
 Nk=M*Xk
 