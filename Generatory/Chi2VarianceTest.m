function Chi2VarianceTest(RNG, N, sigma2,significance)
    vec = RNG.randVector(N);
    v = N - 1 ;
    
    chi_critical1 = icdf('chi2', significance/2, v)
    chi_critical2 = icdf('chi2', 1- significance/2, v)
    
    chi = N*var(vec)/sigma2

    if(chi < chi_critical1 || chi > chi_critical2 )
        fprintf('There is no reason to accept the hypothesis.\n');
    else
        fprintf('There is no reason to reject the hypothesis.\n');
    end
end
