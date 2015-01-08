clear all;close all;

M = ones(4,4) -diag([1,1,1,1]);
 
[P,D] = eig(M);

Q = [1 0 0 1;
    -1 1 0 1;
     0 -1 1 1;
     0 0 -1 1];
 
 m=Q*D*inv(Q);
 
 a = 1;
 b = -3;
 v = (b-a)*ones(4,1);
 
 N = a* ones (4,4) + diag (v);
 
 [PN,DN] =eig(N);