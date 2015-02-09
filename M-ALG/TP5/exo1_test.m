clear all; close all; hold on;

axis equal;

a = 1.4;
A = [cos(a) -sin(a) 
     sin(a)  cos(a)];
 
 X0 =[0.5
     0];
 t = 0:0.1:10;
 l = length(t);
 
 
 for i=1:l
     %subplot(2,2,[1,3]);
     X =expm(t(i)*A)*X0;
     plot(X(1),X(2),'or'); hold on;
     
     V = A*X;
     V_norme (i)= norm(V);
     quiver(X(1),X(2),V(1),V(2),0.5); hold on; 
     surf ([X(1)],[X(2)],[norm(V)]);hold on;
     
     Ac = A*V;
     Ac_norme (i)= norm(Ac); hold on; 
     quiver(X(1),X(2),Ac(1),Ac(2),0.5); hold on;
   
 end;

%  subplot(2,2,2);
%  plot(t,V_norme);
%  
%  subplot(2,2,4);
%  plot(t,Ac_norme);
%  
%  subplot(2,2,[1,3]);
%  for x = -2.5:0.1:2.5
%      for y =-2.5:0.1:2.5
%          
% 
%          V = A*[x;y];
%          quiver(x,y,V(1),V(2),0.2);
%      end
%  end
 
