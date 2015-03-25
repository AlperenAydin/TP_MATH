function x = simulationExp(lambda,n)
    y = rand(1,n);
    
    x = log(1-y) / (-lambda);
end