function bool = variance_test(RGN, var, iter, epsilon, eta)
    results = zeros(iter,1);
    n = 1000;
    
    for i=1:iter
       results(i) = abs(variance_approx(RGN, n) - var) < epsilon;
    end
    
    bool = size(results(results > 0),1)/size(results, 1) > eta;
end