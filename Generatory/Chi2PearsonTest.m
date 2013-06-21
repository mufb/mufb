function Chi2PearsonTest(RNG, N, bins, dist, params, significance)
    degs_of_freedom = bins - size(params,2) - 1;
    chi_critical = icdf('chi2', 1- significance, degs_of_freedom)
    vec = RNG.randVector(N);
    [nelems, points] = getBins(vec, bins, dist, params)
    
    chi = sum(((nelems - N/bins).^2)/(N/bins))
    
    if(chi > chi_critical)
        fprintf('There is no reason to accept the hypothesis.\n');
    else
        fprintf('There is no reason to reject the hypothesis.\n');
    end
end

function [nelems, points] = getBins(vec, bins, dist, params)
    points = zeros(bins-1, 1);
    nelems = zeros(bins, 1);
    ns = linspace(1/bins, 1 - 1/bins, bins-1);
    for i = 1:bins-1
       points(i) = callInverse(dist, ns(i), params); 
       if(i == 1)
           nelems(i) = size(vec(vec < points(i)), 1);
       else
           nelems(i) = size(vec(vec < points(i)), 1) - size(vec(vec < points(i - 1)), 1);    
       end
    end
    nelems(bins) = size(vec(vec > points(bins-1)), 1);
end

function y = callInverse(dist, X, params)
    switch size(params,2)
        case 1
            y = icdf(dist, X, params(1));
        case 2
            y = icdf(dist, X, params(1), params(2));
        case 3
            y = icdf(dist, X, params(1), params(2), params(3));
        otherwise
            assert('Too much!');
    end
end