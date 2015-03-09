function [X,Y]= traj_particule (p,n)

    X = zeros(n+1,1);
    Y = zeros(n+1,1);

    for i=1:n
    
     top = rand;

    if (top<p)
      X(i+1)=X(i)+1;
      Y(i+1)=Y(i);

    else
     Y(i+1)=Y(i)+1;
     X(i+1)=X(i);
   
    end

        end

end