function bool = mean_test(RGN, mean, iter, epsilon, eta)
    results = zeros(iter,1);
    n = 1000;
    for i=1:iter
       results(i) = abs(mean_approx(RGN, n) - mean) < epsilon;
    end
    
    bool = size(results(results > 0),1)/size(results, 1) > eta;
end