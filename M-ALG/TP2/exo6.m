M = [2 3 -1 
     1 4 2
     -2 1 4];
 
 A = [2 3 
      1 4];
  
  U = [-1;2];
  
  V = [-2 ; 1];
  
  alpha = 4;
  
  S = A - U*V'/alpha; 
  P = inv(S)
  
  Q = - P*U/alpha;
  
  W = - V'*P/alpha;
  
  s = (1/alpha) +(1/alpha^2)*V'*P*U;