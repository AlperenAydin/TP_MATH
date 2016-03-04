close all; clear all; hold on;


for i = 1:5
    X = randi(5,1,2);
    x =X(1); y = X(2);
    
    K = ones(2,4);
    K(1,:) = x*K(1,:); K(2,:) = y*K(2,:);
    
    F = [-1, 1, 0, 0
        0, 0, -2 , -0.5];
    
    F = F +K;
    
    A = F(:,1);
    B = F(:,2);
    C = F(:,3);
    P = F(:,4);
    
    
    q = 0.9;
    Q = q*P + (1-q)*A; F(:,5) = Q;
    R = q*P + (1-q)*B; F(:,6) = R;
    S = q*P + (1-q)*C; F(:,7) = S;
    
    T = lineIntersection(S,B,R,C); F(:,8) = T;
    U = lineIntersection(R,A,Q,B); F(:,9) = U;
    V = lineIntersection(S,A,Q,C); F(:,10) = V;
    
    
    PG1 = F(:,[4,6,9,5]);
    PG2 = F(:,[4,6,8,7]);
    PG3 = F(:,[4,5,10,7]);
    fill(PG1(1,:),PG1(2,:),'r');
    fill(PG2(1,:),PG2(2,:),'b');
    fill(PG3(1,:),PG3(2,:),'g');
    
end