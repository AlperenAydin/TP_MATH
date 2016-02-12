close all; clear all; pause on;

f = @(x)(8-4.5*(x -sin(x)));
incertitude = 0.001;

a = 0;
b = 5;
tol = (b-a)/2;
M = [];

while (abs(tol) > incertitude)
    tol = (b-a)/2;
    mil = a + tol;
    
    M = [M, mil];
    plot(M); grid on;
    pause(0.01);
    
    
    F = f(mil);
    if(F == 0)
        disp('Le resultat est ');
        disp(mil);
        break;
    end
    if( F * f(a) < 0 )
        b = mil;
    else
        a = mil;
    end
end


x = linspace(a,b, 10);
F = f(x);
plot(x,F);

