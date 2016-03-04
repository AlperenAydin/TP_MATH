function F = interation(f, f_prev, dx, dt)

l = length(f);
a = (dt/dx)^2;

F = 2*(1-a)*f - f_prev; 

F(1:l-1) = F(1:l-1) + a*f(2:l);
F(2:l) = F(2:l) + a*f(1:l-1);
end